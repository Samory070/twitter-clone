get '/followers/new' do
  @follower = Follower.new
  erb :"followers/new"
end

post '/followers' do
  @follower = Follower.new(follower_id: current_user.id, follower_id: current_user.id)
    redirect "/users/current_user.id"
end