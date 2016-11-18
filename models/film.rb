require('pg')
require_relative('../db/sql_runner')
require_relative('customer')

class Film

  attr_accessor :title, :price 
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price']
    @film_id = options['film_id'].to_i
    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title) = (#{@title});"
    films = SqlRunner.run(sql)
    return films.map {|update| Film.new(update)}
  end
# in update above can I not update price at the same time? e.g. (title, price) = (#{@title}, #{@price});"

  def delete
    sql = "DELETE FROM film WHERE id = #{@film_id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films;"
    films = SqlRunner.run(sql)
    return films.map { |movie| Film.new(movie) }
  end

end