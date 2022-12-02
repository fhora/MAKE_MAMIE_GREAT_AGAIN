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

user1 = User.new(email: "paul@gmail.com", first_name: "Paul", last_name: "Denis-Farge", password: "testest", phone_number: "0678901665", description:  "Je m'appelle Paul, j'ai 78ans.\r\n\r\nJe vis seul en autonomie à Paris mais je cherche régulièrement une personne pour m'accompagner faire une promenade le long du canal Saint-Martin.\r\n\r\nJe préfère les profils discrets et bienveillants.\r\n\r\nJe suis également capable d'échanger en anglais.")
user1.save
mission = Mission.create!(user: user1, title: "Bring me to the walk", description: "I would like to be with some company to walk through the park in Paris on Sunday", start_date: DateTime.parse("01/01/2023 14:00"), location: "48, rue du Chateau Landon, 75010 Paris", reward_cents: 10000)
