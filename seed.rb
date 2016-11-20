require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

Customer.delete_all
Film.delete_all
Ticket.delete_all

customer1 = Customer.new({'name' => 'Logan Smith', 'funds' => 50})
customer2 = Customer.new({'name' => 'Joe Bloggs', 'funds' => 25})
customer3 = Customer.new({'name' => 'Mr. Pink', 'funds' => 100})

customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({'title' => 'Ghost in the Shell', 'price' => 15})
film2 = Film.new({'title' => 'Fantastic Beasts', 'price' => 15})
film3 = Film.new({'title' => 'Rogue One', 'price' => 20})

film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})

ticket1.save()
ticket2.save()

customer1.funds -= film2.price 
customer1.update()

customers = Customer.all()
films = Film.all()
tickets = Ticket.all()


binding.pry
nil
