# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
                  password: Faker::Internet.password(min_length: 6)
                )
  plant.save
end

