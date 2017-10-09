get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/users/signup' do
  puts params
  @user = User.new(:name => params[:name], :username => params[:username],:email => params[:email], :password => params[:password])
  if @user.save
    erb :'/users/new'
  else
    "Cannot sign up, username already exists"
  end
end

get '/users/new' do
  erb :'/users/new'
end

get '/users/login' do
  erb :'/users/login'
end

# Not correct :s
get '/users/:id' do
  redirect:'/'
end

post '/users/login' do
  @user = User.find_by(:username => params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    erb :'users/login'
  else
    "Cannot log in, user not registered"
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect "/"
end
