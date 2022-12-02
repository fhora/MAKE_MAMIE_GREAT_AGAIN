User.destroy_all
arr = ["a","b","c"]
arr.each do |letter|
 user = User.new(email: "#{letter}@#{letter}.com", first_name: "#{letter}", last_name: "#{letter}", password: "testtest")
 Mission.create(user: user, title: "#{user.first_name}'s mission", description: "#{user.first_name}'s mission description", reward_cents: 10000, location: "24 rue jean baptiste pigalle")
 user.save
end

require "faker"
categories = ["Grocery shopping", "Walking", "Medical appointment", "Reading", "Playing cards", "Discussing", "Tea time"]
50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "testtest",
    email: "#{Faker::Name.first_name}.#{Faker::Name.last_name}@gmail.com"
  )
  Mission.create!(
    user:,
    title: "#{categories.sample} with #{user.first_name}",
    description: "#{user.first_name} is very kind and funny, you'll enjoy spending time together!",
    reward_cents: rand(10_000),
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}"
  )
  user.save
end
