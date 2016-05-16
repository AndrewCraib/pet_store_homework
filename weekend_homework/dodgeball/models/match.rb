require('pg')
require_relative('../db/sql_runner')
require_relative('../console.rb')



class Match

      attr_accessor( :id, :home_team_id, :away_team_id, :home_team_score, :away_team_score )

  def initialize( options )
    @id = options['id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
    @goal = Random.new()
    
  end


  def save()
    sql = "INSERT INTO matches 
                          (home_team_id, away_team_id, home_team_score, away_team_score) 
                      VALUES 
                          ('#{@home_team_id}','#{@away_team_id}','#{@home_team_score}', '#{away_team_score}') 
                      RETURNING *"
    return Match.map_item(sql)
  end

  def update()
    sql = "UPDATE matches 
             SET home_team_id = '#{@home_team_id}',
                 away_team_id = '#{@away_team_id}',
                 home_team_score = '#{@home_team_score}'
                 away_team_score = '#{@away_team_score}'
            WHERE id = #{@id}"
      return Match.map_items(sql)
  end


  def self.all()
    sql = "SELECT * FROM matches"
    return Match.map_items(sql)
  end


  def self.delete_all()
    sql = "DELETE FROM matches"
    SqlRunner.run(sql)
  end


  def self.map_items(sql)
    matches = SqlRunner.run(sql)
    result = matches.map { |match| Match.new( match ) }
    return result
  end


  def self.map_item(sql)
    matches = Match.map_items(sql)
    return matches.first
  end

  def played_match()
    t1 = []
    t2 = []
    
    home_team_score = @goal.rand(1..5)
    away_team_score = @goal.rand(1..5)

    if home_team_score > away_team_score
      return t1 << "win"
    else
      return t2 << "win"
    end
  end
end


binding.pry
nil