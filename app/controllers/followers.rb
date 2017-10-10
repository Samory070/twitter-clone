get '/users/:id/followers' do
 @user = User.find_by(id: session[:id])
  @followers = @user.followers
end

get '/users/:id/followers/new' do
  @user = User.find_by(id: session[:id])
  erb :'followers/new'
end

post '/users/:id/followers/new' do
  @user = User.find_by(session[:id])
  @follower = User.find(session[:id])
  # binding.pry
  @user.followers << @follower
  if @follower.save
    redirect "/users/#{@user.id}"
  else
    erb :'/followers/new'
  end
end

