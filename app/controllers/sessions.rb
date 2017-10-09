get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email],params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Invalid login"
    erb :'/sessions/new'
  end
end

get '/sessions/logout' do
  session.clear
  erb :'index'
end

# get '/sessions/:id' do
#   erb :'sessions/show'
# end

