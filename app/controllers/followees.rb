get '/users/:id/followees' do
  @user = User.find(session[:id])
  @followees = @user.followees
end

get '/users/:id/followees/new' do
  @user = User.find(session[:id])
  erb :'followees/new'
end

post '/users/:id/followees/new' do
  @user = User.find(session[:id])
  # @followee = Follow.new(params[:follow])
  @followee = @user.followee_follows.new(params[:followee_id])
  # @user.followees << @followee
  if @followee.save
    redirect "/users/#{@user.id}"
  else
    erb :'/followees/new'
  end
end