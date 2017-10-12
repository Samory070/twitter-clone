get '/tweets/index' do
  # Look in app/views/index.erb
  @tweets = Tweet.all
  erb :'/tweets/index'
end

get '/tweets/new' do
  @tweets = Tweet.all
  erb :'/tweets/new'
end

post '/tweets/new' do
  puts params
  # create new tweet by protecting the session
  @tweet = Tweet.new(content: params[:content], user_id: session[:user_id])
  if @tweet.save
    redirect '/tweets/index'
  else
    "Tweet not created"
  end
end

put '/tweets/edit' do
  "To be done"
  #redirect '/tweets/index'
end

delete '/tweets/:id' do
  @tweet = Tweet.find_by(id: params[:id])
  @user = User.find_by(id: session[:user_id])
  #protect the tweet
  puts @tweet.user_id.to_i
  puts session[:user_id].to_i
  if (@tweet.user_id.to_i == session[:user_id].to_i)
    @tweet.destroy
    redirect '/tweets/index'
  else
    "You cannot delete others people's tweets"
  end
end
