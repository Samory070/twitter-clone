User.delete_all
Tweet.delete_all
Follow.delete_all

number_users = 25

number_users.times do
  user_name = Faker::Internet.user_name
  email = Faker::Internet.free_email(user_name)

  user = User.create!(name: user_name, username: user_name, email: email,
                      password: Faker::Internet.password(10, 15))
  tweet = Tweet.create!(content: Faker::Twitter.status[:text],
    user_id: rand(1..number_users))

end

