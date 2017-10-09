get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/login"
  else
    erb :"users/new"
  end
end

get '/login' do
  erb :"/users/login"
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Invalid login, try again"
    erb :'users/login'
  end
end

#display all users
get '/users/index' do
  @users = User.all
  erb :'users/index'
end

#logout
get '/users/logout' do
  session.clear
  redirect "/"
end

#last item
get '/users/:id' do
  @user = User.find_by(id: params[:id])
  redirect '/' unless current_user.id == session[:user_id]
  erb :'users/show'
end