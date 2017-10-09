# NOT WORKING YET

get '/followers/new' do
  @followed = Follow.new
  erb :"followers/new"
end

post '/followers' do
  @user = User.find(params[:relationship][:followed_id])
end