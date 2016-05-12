require ( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './store' )

  attr_accessor :id, :name, :type, :image

class Pet

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @image = options['image']
  end


  def save()
    sql = "INSERT INTO pets (name, type, image) VALUES ('#{@name}' '#{@type}', '#{@image}') RETURNING *"
    pet = SqlRunner.run( sql ).first 
    result = Pet.new( pet )
    return result
  end


  def update( )
        sql = "UPDATE pets
                SET name = '#{@name}',
                    type = '#{@type}',
                    image = '#{@image}'
              WHERE id = #{@id}"
        pet = SqlRunner.run( sql ).first 
        result = Pet.new( pet )
        return result

  def delete( )
   sql = "DELETE FROM pets 
   WHERE id = #{@id} 
   RETURNING *"
   pet = SqlRunner.run( sql ).first
   return Pet.new( pet)
  end
  end
end


