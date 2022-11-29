User.destroy_all
arr = ["a","b","c"]
arr.each do |letter|
  user = User.new(email: "#{letter}@#{letter}.com", first_name: "#{letter}", last_name: "#{letter}", password: "testtest")
  Mission.create(user: user, title: "#{user.first_name}'s mission", description: "#{user.first_name}'s mission description", reward_cents: 10000, location: "#{user.first_name}'s house")
  user.save
end
