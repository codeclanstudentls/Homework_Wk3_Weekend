require('pg')
require_relative('../db/sql_runner')
require_relative('customer')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price']
    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING *;"
    film = SqlRunner.run(sql)
    @id = film[0]['id'].to_i # Something is not right here as [0] will return the first itemm in the array of ids? 
  end

  def update()
    sql = "UPDATE films SET (title = #{@title}, price = #{@price});"
    films = SqlRunner.run(sql)
    return films.map {|update| Film.new(update)}
  end
# in update above can I not update price at the same time? e.g. (title, price) = (#{@title}, #{@price});"
# or should I have a seperate line for this.  Should I have a WHERE id = #{@id} bit?
  def delete
    sql = "DELETE FROM film WHERE id = #{@film_id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films;"
    films = SqlRunner.run(sql)
    return films.map { |movie| Film.new(movie) }
  end

  def self.delete_all() 
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end