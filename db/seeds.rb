
require 'faker'

Review.destroy_all
Booking.destroy_all
Plant.destroy_all
User.destroy_all

reviews = ['good plants', 'the spikes are too sharp', 'cactus speaks!!!!!']
cities = ['London', 'Paris', 'Milan', 'Dublin', 'Amsterdam']

7.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: cities.sample,
    email: Faker::Internet.email,
    password: 123456
  )
  5.times do
    plant = Plant.create!(
      name: Faker::FunnyName.name,
      species: "Cactus",
      daily_price: "£#{Faker::Number.within(range: 1..10)}",
      user: user,
      instructions: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
      address: user.address
    )
    2.times do
      booking = Booking.create!(
        plant: plant,
        user: User.all.sample,
        start_date: Date.today + rand(0..4),
        end_date: Date.today + rand(5..20)
      )
      Review.create!(
        content: reviews.sample,
        booking: booking,
        stars:rand(1..4)
      )

    end
  end
end

# 7.times do
#   User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     address: Faker::Address.city,
#     email: Faker::Internet.email,
#     password: 123456
#   )
# end

# User.all.each do |user|
#   Plant.create!(
#     name: Faker::FunnyName.name,
#     species: "Cactus",
#     daily_price: "£#{Faker::Number.within(range: 1..10)}",
#     user: user
#   )
# end
# User.all do |user|
#   2.times do
#     Booking.create({plant_id:rand(1..7), user_id: user[id],start_date: Date.today+rand(0..4) ,end_date:Date.today + rand(5..20)})
#   end
# end

# Booking.all do |booking|
#   Review.create( {content: "cool", booking_id:booking[id], stars:rand(1..4)})
# end






