
require 'faker'

Review.destroy_all
Booking.destroy_all
Plant.destroy_all
User.destroy_all

reviews = ['good plants', 'the spikes are too sharp', 'cactus speaks!!!!!']
cities = ['17 Amhurst Terrace, Hackney Downs, London E8 2BT',
          '10 Bethnal Green Rd, Hackney, London E1 6GY',
          'South Kensington, London SW7 4SF',
          'Ladbroke Grove, Notting Hill, London W10 6HJ',
          '9 Battersea Rise, London SW11 1HG']

example_user = User.create!(
    first_name: "Francesca",
    last_name: "Vago",
    address: "138 Kingsland Rd, London E2 8DY",
    email: "francesca@gmail.com",
    password: 123456
  )
  3.times do
    plant = Plant.create!(
      name: Faker::FunnyName.name,
      species: "Cactus",
      daily_price: "£#{Faker::Number.within(range: 1..10)}",
      user: example_user,
      instructions: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum",
      address: example_user.address
    )
    2.times do
      booking = Booking.create!(
        plant: plant,
        user: example_user,
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

5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: cities.sample,
    email: Faker::Internet.email,
    password: 123456
  )
  3.times do
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







