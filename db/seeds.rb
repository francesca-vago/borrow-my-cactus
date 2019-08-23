
require 'faker'

Review.destroy_all
Booking.destroy_all
Plant.destroy_all
User.destroy_all

danger_levels = ["low", "medium", "high", "very high"]
instructions = ["Water it weekly and keep in direct sunlight", "Water daily and keep in shadow", "Trim spikes daily"]
reviews = ['Good plants', 'The spikes are too sharp', 'This one was a bit too big', 'The spikes are to long, very dangerous cactus', "You can borrow Francesca's cacti in total confidence"]
cities = ['Thames Path, London SE1 9JW',
          '30 St Mary Axe, London EC3A 8BF',
          'South Kensington, London SW7 4SF',
          'Ladbroke Grove, Notting Hill, London W10 6HJ',
          '9 Battersea Rise, London SW11 1HG']
images = ['https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1551888419-7b7a520fe0ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1463154545680-d59320fd685d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1509587584298-0f3b3a3a1797?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1534859108275-a3a6f52f0d46?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1509937528035-ad76254b0356?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1519336056116-bc0f1771dec8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1528476513691-07e6f563d97f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1526565782131-a13074f0dbbb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1509222796416-4a1fef025e92?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1528475478853-5b89bed65c4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1493834685523-df9beaf95762?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1528476625962-40d0763c921f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
          'https://images.pexels.com/photos/1657110/pexels-photo-1657110.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://images.pexels.com/photos/1856430/pexels-photo-1856430.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://images.pexels.com/photos/1533960/pexels-photo-1533960.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://images.pexels.com/photos/2568458/pexels-photo-2568458.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://images.pexels.com/photos/1630318/pexels-photo-1630318.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          'https://images.pexels.com/photos/219779/pexels-photo-219779.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
          'https://images.pexels.com/photos/595103/pexels-photo-595103.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']

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
      instructions: instructions.sample,
      address: example_user.address,
      image: images.sample,
      danger_level: danger_levels.sample
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
      instructions: instructions.sample,
      danger_level: danger_levels.sample,
      address: user.address,
      image: images.sample
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







