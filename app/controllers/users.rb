#Condused why this route needs to be before "/user/:id" for this to catch?
get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  current_user
  redirect '/' unless authorized?(current_user)
  erb :'users/show'
end

post '/users' do
    @user = User.new(email: params[:email],
                  full_name: params[:full_name],
                  username: params[:username],
                  password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end