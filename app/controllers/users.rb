get '/users/new' do
  @user = User.new
  erb :'users/new'
end

get '/users/:id' do
  "display a specific user"
  @user = User.find_by(id: params[:id])
  # redirect '/' unless @user.id == session[:user_id]
  erb :'users/show'
end


post '/users' do
  "create a new user"
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    puts @errors
    erb :'users/new'
  end
end
