get '/tweets/index' do
  # Look in app/views/index.erb
  @tweets = Tweet.all
  erb :'/tweets/index'
end

