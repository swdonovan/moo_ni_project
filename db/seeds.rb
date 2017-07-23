# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@counter = 0
@numb = [*1..2000]
@weight = [*1200..1600]
def seed_companies
  @counter = 0
  @c1 = Company.create(name: "Valentine Livestock", city: "Valentine", state: "NE")
  puts "Created Company #{@counter}"
  @c2 = Company.create(name: "Basset Livestock", city: "Basset", state: "NE")
  puts "Created Company #{@counter}"
  @c3 = Company.create(name: "Fort Pierre Livstock", city: "Pierre" , state: "SD")
  puts "Created Company #{@counter}"
  @c4 = Company.create(name: "Martin Livstock", city: "Martin" , state: "SD")
  puts "Created Company #{@counter}"
  @c5 = Company.create(name: "Aberdeen Livestock", city: "Aberdeen" , state: "SD")
  puts "Created Company #{@counter}"
  @c6 = Company.create(name: "North Platte Livestock", city: "North Platte", state: "NE")
  puts "Created Company #{@counter}"
end
def seed_ranch_transactions
  @counter = 0
  @trans1 = @c1.ranch_transactions.create(date: Date.today - 123.days, amount: 120000)
  puts "Created Transaction #{@counter}"
  @trans2 = @c4.ranch_transactions.create(date: Date.today - 1.days, amount: 1500)
  puts "Created Transaction #{@counter}"
  @trans3 = @c3.ranch_transactions.create(date: Date.today - 32.days, amount: 10000)
  puts "Created Transaction #{@counter}"
  @trans4 = @c5.ranch_transactions.create(date: Date.today - 53.days, amount: 100000)
  puts "Created Transaction #{@counter}"
  @trans5 = @c3.ranch_transactions.create(date: Date.today - 55.days, amount: 220000)
  puts "Created Transaction #{@counter}"
  @trans6 = @c6.ranch_transactions.create(date: Date.today - 31.days, amount: 5)
  puts "Created Transaction #{@counter}"
  @trans7 = @c2.ranch_transactions.create(date: Date.today - 55.days, amount: 10)
  puts "Created Transaction #{@counter}"
  @trans8 = @c5.ranch_transactions.create(date: Date.today - 50.days, amount: 12065)
  puts "Created Transaction #{@counter}"
  @trans9 = @c1.ranch_transactions.create(date: Date.today - 8.days, amount: 120032)
  puts "Created Transaction #{@counter}"
  @trans_0 = @c3.ranch_transactions.create(date: Date.today - 2.days, amount: 120230)
  puts "Created Transaction #{@counter}"
  @trans_1 = @c2.ranch_transactions.create(date: Date.today - 10.days, amount: 120)
  puts "Created Transaction #{@counter}"
end

seed_companies
seed_ranch_transactions
