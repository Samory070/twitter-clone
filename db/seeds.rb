User.delete_all
Tweet.delete_all
Follow.delete_all

number_users = 50
half_nb_users = number_users/2

number_users.times do
  user_name = Faker::Internet.user_name
  email = Faker::Internet.free_email(user_name)

  user = User.create!(name: user_name, username: user_name, email: email,
                      password: Faker::Internet.password(10, 15))
  tweet = Tweet.create!(content: Faker::Twitter.status[:text],
    user_id: rand(1..number_users))


  id1 = rand(1..half_nb_users)
  id2 = rand((half_nb_users + 1)..number_users)
  follow = Follow.create!(user_id1: id1, user_id2: (id1 + rand(1..id1)))

end

