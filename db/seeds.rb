Follow.delete_all
Tweet.delete_all
User.delete_all

thomas = User.create!(email: "thomas@t.com",
            full_name: "Thomas Raff",
            username: "thomas",
            password: "1234" )

tt = User.create!(email: "t@t.com",
            full_name: "T Raff",
            username: "t",
            password: "1234" )

tr = User.create!(email: "tr@t.com",
            full_name: "T Raff",
            username: "tr",
            password: "1234" )

Tweet.create!(body: "Test Tweet 1 - created by thomas",
              user: thomas)

Tweet.create!(body: "Test Tweet 2 - created by t",
              user: tt)

Tweet.create!(body: "Test Tweet 3 - created by t",
              user: tt)

Tweet.create!(body: "Test Tweet 4 - created by t",
              user: tt)

#In testing make sure tr does not have any tweets and should have no followers
#Through what I believe is a source validation we should be able to limit the following of a user by a user to 1
Follow.create!(follower: tr, followee: thomas)
Follow.create!(follower: tr, followee: tt)
Follow.create!(follower: thomas, followee: tt)
Follow.create!(follower: tt, followee: thomas)
Follow.create!(follower: tt, followee: tt)


