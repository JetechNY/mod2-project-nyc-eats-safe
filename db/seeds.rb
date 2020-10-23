require 'faker'

50.times do 
Dish.create({name: Faker::Food.unique.dish})
end 

75.times  do 
Restaurant.create({name: Faker::Restaurant.unique.name, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone, capacity: rand(15..30), cuisine: Faker::Restaurant.type })
end 

10.times do
User.create({name: Faker::Name.name, email: Faker::Internet.unique.email ,address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone, password: "123"}) 
end 

200.times do 
Menu.create({restaurant_id: Restaurant.all.sample.id, dish_id: Dish.all.uniq.sample.id, price: rand(15..30)})
end 

20.times do 
Reservation.create({user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, date: Faker::Date.between(from: Date.today, to: 1.year.from_now), time: Time.now.strftime('%H:%M'), party_size: rand(1..6)}) 
end 