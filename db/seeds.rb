10.times do
User.create!(fullname: Faker::Name.first_name + Faker::Name.last_name, username: Faker::Name.name,
  email: Faker::Internet.free_email, password: Faker::Internet.password(10, 20))
end
