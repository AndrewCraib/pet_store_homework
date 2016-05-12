require( 'pg' )
require_relative( '../db/sql_runner' )

class Store

  attr_accessor :id, :name, :address, :stock_type


    def initialize( options )
      @id = options['id'].to_i
      @name = options['name']
      @address = options['address']
      stock_type = options['stock-type']
  end

  def save()
    sql = "INSERT INTO stores (name, address, stock_type,pets_id) 
    VALUES ('#{@name}', 
            '#{@address}', 
            '#{@stock_type}, 
            '#{@pets_id}') RETURNING *"
    store = SqlRunner.run( sql ).first 
    result = Store.new( store )
    return result
  end

  def update( )
        sql = "UPDATE stores 
                SET name = '#{@name}',
                    address = '#{@address}',
                    stock_type = '#{@stock_type}',
              WHERE id = #{@id}"
        store = SqlRunner.run( sql ).first 
        result = Store.new( store )
        return result


  def delete( )
   sql = "DELETE FROM stores WHERE id = #{@id}"
   store = SqlRunner.run( sql ).first
   return Store.new( store )
  end
  end
end