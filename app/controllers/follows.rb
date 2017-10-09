get '/followers/new' do
  @follower = Follow.new
  erb :"followers/new"
end

post '/followers' do
  @follower = Follow.new(follower_id: current_user.id, follower_id: params[:user_id])
    redirect "/users/current_user.id"
end