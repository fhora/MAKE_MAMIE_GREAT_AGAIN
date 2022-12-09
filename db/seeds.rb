require "faker"
include Rails.application.helpers

User.destroy_all

ADDRESS = [
  "16 villa gaudelet, Paris",
  "63 avenue parmentier, Paris",
  "Pigalle, Paris",
  "Eiffel Tower, Paris",
  "Montparnasse Cemetery, Paris",
  "23 Rue Blomet, Paris"
]

def rand_date
  Time.at(rand(Time.now.to_i..(Time.now + 5_260_000).to_i))
end

arr = ["marine", "eliott", "c"]
arr.each do |letter|
  user = User.new(
    email: "#{letter}@#{letter}.com",
    first_name: letter.to_s,
    last_name: letter.to_s,
    password: "testtest"
  )

  category = Mission::CATEGORIES.sample

  Mission.create(
    user:,
    title: "#{find_title(category)}'s mission with #{user.first_name}",
    description: "#{user.first_name}'s mission description",
    reward_cents: 10_000,
    location: "24 rue jean baptiste pigalle",
    start_date: rand_date,
    category_list: category
  )
  user.save
end

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new(
    first_name:,
    last_name:,
    password: "testtest",
    email: "#{first_name}.#{last_name}@gmail.com"
  )

  category = Mission::CATEGORIES.sample

  Mission.create!(
    user:,
    title: "#{find_title(category)} with #{user.first_name}",
    description: "#{user.first_name} is very kind and funny, you'll enjoy spending time together!",
    reward_cents: rand(10_000),
    start_date: rand_date,
    location: ADDRESS.sample,
    category_list: category
  )
  user.save
end

user1 = User.new(
  email: "paul@gmail.com",
  first_name: "Paul",
  last_name: "Denis-Farge",
  password: "testest",
  phone_number: "0678901665",
  description:  "Je m'appelle Paul, j'ai 78ans.\r\n\r\nJe vis seul en autonomie à Paris mais je cherche régulièrement une personne pour m'accompagner faire une promenade le long du canal Saint-Martin.\r\n\r\nJe préfère les profils discrets et bienveillants.\r\n\r\nJe suis également capable d'échanger en anglais."
)
user1.save

category = Mission::CATEGORIES.sample
Mission.create!(
  user: user1,
  title: "Bring me to the walk",
  description: "I would like to be with some company to walk through the park in Paris on Sunday",
  start_date: rand_date,
  location: "48, rue du Chateau Landon, 75010 Paris",
  reward_cents: 10_000,
  category_list: category
)
