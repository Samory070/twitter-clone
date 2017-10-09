User.create(first_name: "Catherine", last_name: "Rice", username: "Cat", email: "cat@cat.com", password: "cat1")
User.create(first_name: "David", last_name: "Rice", username: "drice", email: "david@david.com", password: "david1")
User.create(first_name: "Kitty", last_name: "Cat", username: "kittycat", email: "kitty@cat.com", password: "kittycat1")

Tweet.create(text: "This is a test tweet", user_id: 1)
Tweet.create(text: "Another test tweet", user_id: 2)
Tweet.create(text: "Yet another test tweet", user_id: 3)

Follow.create(follower_id: 1, followee_id: 3)
Follow.create(follower_id: 2, followee_id: 1)
Follow.create(follower_id: 3, followee_id: 2)