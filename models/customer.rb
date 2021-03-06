require('pg')
require_relative('../db/sql_runner')
require_relative('film')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *;"
    customer = SqlRunner.run(sql)
    @id = customer[0]['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', #{@funds}) WHERE id = #{@id} ;"
    customers = SqlRunner.run(sql)
    return customers.map { |update| Customer.new(update) }
  end


  def delete
    sql = "DELETE FROM customer WHERE id = #{@customer_id};"
    SqlRunner.run(sql)
  end


  def self.all()
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    return customers.map { |person| Customer.new(person) }
  end

  def self.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end


end