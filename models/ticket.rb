require('pg')
require_relative('../db/sql_runner')
require_relative('customer')
require_relative('film')

class Ticket

  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i

  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) 
    VALUES ('#{@customer_id}', #{@film_id}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def delete
    sql = "DELETE FROM ticket WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    tickets = SqlRunner.run(sql)
    return tickets.map { |stub| Customer.new(stub) }
  end
  
end