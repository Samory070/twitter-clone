get '/' do
  redirect '/users'
end

#show all users
get '/users' do
  @users = User.all
  erb :index
end

#get new user form
get '/users/new' do
  @user = User.new
  erb :new
end

# create new user
post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    redirect '/'
  else
    status 422
    @errors = user.errors.full_messages
    erb :new
  end
end

#user page
get '/users/:id' do
  user = User.find(params[:id])
  redirect '/' unless user.id == session[:user_id]
  erb :show
end

#get login form
get '/sessions/new' do
 erb :'/sessions/new'
end

#validate new user
# post '/sessions' do
#   @user = User.authenticate(params[:user][:username], params[:user][:password])
#   if  @user
#     session[:user_id] = params[:user.id]
#     redirect '/'
#   else
#     status 422
#     @errors = ["Login failed."]
#     erb :'sessions/login'
#   end
# end

post '/sessions' do
  user = User.find_by(params[:user][:email])
  if user.password == params[:user][:password]
    redirect '/'
  else
    status 422
    @errors = ['Login failed']
  end
end

# post '/sessions' do
#   @user = User.find_by(params[:username])
#   if @user.authenticate(params[:username])
#     session[user_id] = user.id
#     redirect "/users/#{@user.id}"
#   else
#     erb :'/sessions/login'
#   end
# end

#delete user
delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  redirect '/users'
end
