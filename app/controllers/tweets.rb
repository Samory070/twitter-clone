# get '/tweets' do
#   @tweets = Tweet.all
#   erb :'tweets/index'
# end

get '/tweets/new' do
  @tweet = Tweet.new
  erb :'/tweets/new'
end

post '/tweets' do
  puts params
  @tweet = Tweet.new(params[:tweet])
  @tweet.user = current_user
  @tweet.save
  redirect '/'
end

get '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  erb :'tweets/show'
end

get '/tweets/:id/edit' do
  @tweet = Tweet.find(params[:id])
  erb :'tweets/edit'
end

def update_tweet
  puts params
  @tweet = Tweet.find(params[:id])
  @tweet.update(params[:tweet])
  redirect "/tweets/#{@tweet.id}"
end

patch '/tweets/:id' do
  update_tweet
end

puts '/tweets/:id' do
  update_tweet
end

delete '/tweets/:id' do
  Tweet.find(params[:id]).destroy!
  redirect '/tweets'
end
