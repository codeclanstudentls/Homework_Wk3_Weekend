require('pg')
require_relative('../db/sql_runner')
require_relative('film')

class Customer

attr_accessor :name, :funds
attr_reader :id

def initialize(options)
  @name = options['name']
  @funds = options['funds'].to_i
  @customer_id = options['customer_id'].to_i
  @id = options['id'].to_i if options['id']
end


def save
  sql = "INSERT INTO customers (name, funds, customer_id) VALUES ('#{@name}', #{@funds}, #{@customer_id}) RETURNING *;"
  result = SqlRunner.run(sql)
  @id = result[0]['id'].to_i

end









end