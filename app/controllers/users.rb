#Sign up
get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  user = User.create(params[:user])
  # puts user

  if user.valid?
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    status 422
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

#Show
get '/users/:id' do
  @tweets = Tweet.all
  @user = User.find(params[:id])
  erb :'users/show'
end
