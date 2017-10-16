Tweet.delete_all

10.times do
  Tweet.create!(subject: Faker::Company.buzzword, content: Faker::Lorem.sentence(3), username: Faker::Internet.user_name)
end
