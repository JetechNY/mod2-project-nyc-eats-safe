# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Faker::Address.street_address
# Faker::PhoneNumber.cell_phone
# Faker::Name.name
# Faker::Dessert.variety
# Faker::Company.name
# Faker::Date.between(from: Date.today, to: 1.year.from_now)
# Faker::Date.birthday(min_age: 18, max_age: 65)
# Faker::Food.dish

50.times do 
Dish.create({name: Faker::Food.unique.dish})
end 

75.times  do 
Restaurant.create({name: Faker::Restaurant.unique.name, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone, capacity: rand(15..30), cuisine: Faker::Restaurant.type })
end 

10.times do
User.create({name: Faker::Name.name, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone, password: "123"}) 
end 

200.times do 
Menu.create({restaurant_id: Restaurant.all.sample.id, dish_id: Dish.all.uniq.sample.id, price: rand(15..30)})
end 

20.times do 
Reservation.create({user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, date: Faker::Date.between(from: Date.today, to: 1.year.from_now), time: Time.now.strftime('%H:%M'), party_size: rand(1..6)}) 
end 