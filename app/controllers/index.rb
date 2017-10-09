get '/' do
  @tweets = Tweet.all
  current_user
  erb :index
end
