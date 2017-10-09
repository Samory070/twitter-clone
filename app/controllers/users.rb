
get"/users/:id" do
  @tweets = Tweet.all
  @other_user = User.find_by(id: params[:id])
  erb :"users/show"
end

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
