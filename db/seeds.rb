
require 'faker'

5.times do
  plant = Plant.new(
    name: Faker::FunnyName.name,
    species: "Cactus",
    daily_price: "£#{Faker::Number.within(range: 1..10)}"
    )
  plant.user =  User.create(
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  address: Faker::Address.city,
                  email: Faker::Internet.email,
                  password: 123456
                )
  plant.save #this is useless
end


#this will create a booking
Booking.new({plant_id:2, user_id: 6,start_date: Date.today,end_date:Date.today + 4})
Review.new( {content: "cool", booking_id:1, stars:5})

