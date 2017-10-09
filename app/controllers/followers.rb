get '/users/:id/followers' do
 @user = User.find_by(id: session[:id])
  @followers = @user.followers
end

get '/users/:id/followers/new' do
  @user = User.find_by(id: session[:id])
  erb :'followers/new'
end

post '/users/:id/followers/new' do
  @user = User.find_by(id: session[:id])
  @follower = Follow.new(follower_id: params[:id])
  # binding.pry
  @user.followers << @follower
  if @follower.save
    redirect "/users/#{@user.id}"
  else
    erb :'/followers/new'
  end
end