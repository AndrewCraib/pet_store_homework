require('pg')
require_relative('../db/sql_runner')

class Team

      attr_accessor :id, :name, :location, :coach

  def initialize( options )
    @id = options['id']
    @name = options['name']
    @location = options['location']
    @coach = options['coach']
  end


  def save()
    sql = "INSERT INTO teams (name, location, coach) 
                      VALUES 
                            ('#{@name}','#{@location}','#{@coach}') 
                      RETURNING *"
    return Team.map_item(sql)
  end

  def update()
    sql = "UPDATE teams 
             SET name = '#{@name}',
                 location = '#{@location}',
                 coach = '#{@coach}'
            WHERE id = #{@id}"
      return Team.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM teams"
    return Team.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    teams = SqlRunner.run(sql)
    result = teams.map { |team| Team.new( team ) }
    return result
  end


  def self.map_item(sql)
    teams = Team.map_items(sql)
    return teams.first
  end

end