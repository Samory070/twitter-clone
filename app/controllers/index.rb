get '/' do
  @tweets = Tweet.all
  erb :'tweets/index'
end
