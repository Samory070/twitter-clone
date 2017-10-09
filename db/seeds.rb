Follow.delete_all
Tweet.delete_all
User.delete_all

u1 = User.create!(email: "thomas@t.com",
            full_name: "Thomas Raff"
            username:"thomas",
            hash_password: "1234" )

u2 = User.create!(email: "t@t.com",
            full_name: "T Raff"
            username:"t",
            hash_password: "1234" )

u3 = User.create!(email: "tr@t.com",
            full_name: "T Raff"
            username:"tr",
            hash_password: "1234" )

Tweet.create!(body: "Test Tweet 1 - created by thomas",
              users: u1)

Tweet.create!(body: "Test Tweet 2 - created by t",
              users: u2)

Tweet.create!(body: "Test Tweet 3 - created by t",
              users: u2)

Tweet.create!(body: "Test Tweet 4 - created by t",
              users: u2)

#In testing make sure u3 does not have any tweets and should have no followers
#Through what I believe is a source validation we should be able to limit the following of a user by a user to 1
Follow.create!(follower: u3, followee: u1)
Follow.create!(follower: u3, followee: u2)
Follow.create!(follower: u1, followee: u2)
Follow.create!(follower: u2, followee: u1)
Follow.create!(follower: u2, followee: u2)


