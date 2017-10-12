get '/tweets' do
  # Look in app/views/index.erb
  @tweets = Tweet.all
  erb :'tweets/index'
end

get '/tweets/new' do
  @tweets = Tweet.all
  erb :'tweets/new'
end

post '/tweets' do
  #puts params
  # create new tweet by protecting the session
  @tweet = Tweet.new(content: params[:content], user_id: session[:user_id])
  if @tweet.save
    redirect '/tweets'
  else
    "Tweet not created"
  end
end

put '/tweets/:id' do
  "To be done"
  #redirect '/tweets/index'
end

delete '/tweets/:id' do
  @tweet = Tweet.find_by(id: params[:id])
  #protect the tweet
  if (@tweet.user_id.to_i == session[:user_id].to_i)
    @tweet.destroy
    redirect '/tweets'
  else
    "You cannot delete others people's tweets"
  end
end
