#Sign up
get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  user = User.create(params[:user])
  puts user

  if user.valid?
    redirect '/sessions/new'
  else
    status 422
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end
