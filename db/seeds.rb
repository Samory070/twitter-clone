require 'faker'
('A'..'Z').to_a.each { |letter| User.create(firstname: "#{letter}",lastname: "#{letter}", username: "#{letter}", email: "#{letter}"@"#{letter}".com, password: "#{letter}") }

tweets = []
follows = []

User.all.each do |user|
  user.tweets << Tweet.create(content: "Tweet posted by #{user.username}")
  user.follows << User.find(id)
  user.save
end

Tweet.all.each do |tweet|
  "#{tweet}"
end
