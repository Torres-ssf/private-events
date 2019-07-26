# frozen_string_literal: true

User.create!(name: 'Bola',
             email: 'bola@example.com')

User.create!(name: 'Sergio',
             email: 'sergio@example.com')

15.times do |n|
  name = Faker::Name.name
  email = "#{name.split[0]}-#{n + 1}@example.com"
  User.create!(name: name,
               email: email)
end

users = User.order(:created_at).take(10)
t = Time.now
10.times do |n|
  add = -6_000
  users.each do |user|
    add += 1000
    time = t + add
    description = Faker::Lorem.sentence(5)
    location = Faker::Address.full_address
    user.events.create!(name: description.split[0],
                        location: location,
                        description: description,
                        time: time)
    user.attended.create!(attended_event_id: n + 1)
  end
end
