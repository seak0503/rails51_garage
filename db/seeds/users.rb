User.create!([
  {name: "admin1", email: "admin1@test.com", password: "admin1"},
  {name: "public1", email: "public1@test.com", password: "public1"},
  {name: "public2", email: "public2@test.com", password: "public2"},
])

30.times do |i|
  User.create!({name: "public#{i+3}", email: "public#{i+3}@test.com", password: "public#{i+3}"})
end