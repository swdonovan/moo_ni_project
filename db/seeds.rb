
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

@change = [*10..25]

def seed_companies
  @counter = 0

  @c1 = Company.create(name: "Valentine Livestock", city: "Valentine", state: "NE")
  puts "Created Company #{@counter}"
  @counter += 1
  @c2 = Company.create(name: "Basset Livestock", city: "Basset", state: "NE")
  puts "Created Company #{@counter}"
  @counter += 1
  @c3 = Company.create(name: "Fort Pierre Livstock", city: "Pierre" , state: "SD")
  puts "Created Company #{@counter}"
  @counter += 1
  @c4 = Company.create(name: "Martin Livstock", city: "Martin" , state: "SD")
  puts "Created Company #{@counter}"
  @counter += 1
  @c5 = Company.create(name: "Aberdeen Livestock", city: "Aberdeen" , state: "SD")
  puts "Created Company #{@counter}"
  @counter += 1
  @c6 = Company.create(name: "North Platte Livestock", city: "North Platte", state: "NE")
  puts "Created Company #{@counter}"
end

def seed_ranch_transactions
  @counter = 0

  @trans1 = @c1.ranch_transactions.create(date: Date.today - 123.days, amount: 120000)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans2 = @c4.ranch_transactions.create(date: Date.today - 1.days, amount: 1500)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans3 = @c3.ranch_transactions.create(date: Date.today - 32.days, amount: 10000)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans4 = @c5.ranch_transactions.create(date: Date.today - 53.days, amount: 100000)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans5 = @c3.ranch_transactions.create(date: Date.today - 55.days, amount: 220000)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans6 = @c6.ranch_transactions.create(date: Date.today - 31.days, amount: 5)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans7 = @c2.ranch_transactions.create(date: Date.today - 55.days, amount: 10)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans8 = @c5.ranch_transactions.create(date: Date.today - 50.days, amount: 12065)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans9 = @c1.ranch_transactions.create(date: Date.today - 8.days, amount: 120032)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans_0 = @c3.ranch_transactions.create(date: Date.today - 2.days, amount: 120230)
  puts "Created Transaction #{@counter}"
  @counter += 1
  @trans_1 = @c2.ranch_transactions.create(date: Date.today - 10.days, amount: 120)
  puts "Created Transaction #{@counter}"
  @counter += 1
end

def seed_residences
  @counter = 0

  @r1  = Residence.create(name: "Bull Pasture", max_capacity: 80)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r2  = Residence.create(name: "Calving Pasture", max_capacity: 120)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r3  = Residence.create(name: "Lot 1", max_capacity: 250)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r4  = Residence.create(name: "Lot 2", max_capacity: 250)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r5  = Residence.create(name: "Lot 3", max_capacity: 250)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r6  = Residence.create(name: "Lot 4", max_capacity: 250)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r7  = Residence.create(name: "Lot 5", max_capacity: 250)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r8  = Residence.create(name: "Lot 6", max_capacity: 250)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r9  = Residence.create(name: "Lot 7", max_capacity: 250)
  puts "Created Residence #{@counter}"
  @counter += 1
  @r0  = Residence.create(name: "Lot 8", max_capacity: 250)
  puts "Created Residence #{@counter}"
  @counter += 1
  @res = Residence.create(name: "Summer Pasture", max_capacity: 350)
  puts "Created Residence #{@counter}"
  @counter += 1
end

def seed_cows
  @counter = 0
  100.times do
    r = @r3.feeder_cows.create(tag_number: @numb[@counter])
    r.feeder_weights.create(weight: @weight.sample)
    puts "Created Feeder #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

  100.times do
    r = @r4.feeder_cows.create(tag_number: @numb[@counter])
    r.feeder_weights.create(weight: @weight.sample)
    puts "Created Feeder #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

  100.times do
    r = @r5.feeder_cows.create(tag_number: @numb[@counter])
    r.feeder_weights.create(weight: @weight.sample)
    puts "Created Feeder #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

  100.times do
    r = @r6.feeder_cows.create(tag_number: @numb[@counter])
    r.feeder_weights.create(weight: @weight.sample)
    puts "Created Feeder #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

  100.times do
    r = @r7.feeder_cows.create(tag_number: @numb[@counter])
    r.feeder_weights.create(weight: @weight.sample)
    puts "Created Feeder #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

  100.times do
    r = @r8.feeder_cows.create(tag_number: @numb[@counter])
    r.feeder_weights.create(weight: @weight.sample)
    puts "Created Feeder #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

  100.times do
    r = @r9.feeder_cows.create(tag_number: @numb[@counter])
    r.feeder_weights.create(weight: @weight.sample)
    puts "Created Feeder #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

  100.times do
    r = @r0.feeder_cows.create(tag_number: @numb[@counter])
    r.feeder_weights.create(weight: @weight.sample)
    puts "Created Feeder #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

@counter = 100
  175.times do
    r = @r1.calving_cows.create(tag_number: @numb[@counter])
    r.calving_cow_weights.create(weight: @weight.sample)
    puts "Created Calving Cow #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end

@counter = 300
  75.times do
    r = @r2.calving_cows.create(tag_number: @numb[@counter])
    r.calving_cow_weights.create(weight: @weight.sample)
    puts "Created Calving Cow #{r.tag_number} in lot #{r.residence.name}"
    @counter += 1
  end
end

def seed_weights_with_incoming
  FeederCow.all.each do |cow|
    cow.feeder_weights.create(weight: (cow.feeder_weights.first.weight - @change.sample), weight_type: 1 )
  end
end

# seed_companies
# seed_ranch_transactions
# seed_residences
# seed_cows
seed_weights_with_incoming
