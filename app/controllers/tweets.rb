get '/tweets' do
  redirect "/"
end

get '/tweets/new' do
  current_user
  redirect '/' unless authorized?(current_user)
  erb :'tweets/new'
end

post '/tweets' do
  current_user
  redirect '/' unless authorized?(current_user)
  @new_tweet = Tweet.new(user_id: current_user.id, body: params[:body])
  if @new_tweet.save
    redirect '/'
  else
    @errors = @new_tweet.errors.full_messages
    erb :'tweets/new'
  end
end

get '/tweets/:id/edit' do
  @tweet = Tweet.find_by(id: params[:id])
  redirect "/" unless own_tweet?(@tweet)
  erb :'tweets/edit'
end

put "/tweets/:id" do
  current_user
  @tweet = Tweet.find_by(id: params[:id])
  redirect '/' unless @tweet.user == current_user
  @tweet.assign_attributes(params[:post])
  if @tweet.save
    redirect "/"
  else
    @errors = @tweet.errors.full_messages
    erb :'tweets/edit'
  end
end

delete "/tweets/:id" do
  current_user
  @tweet = Tweet.find_by(id: params[:id])
  redirect '/' unless @tweet.user == current_user
  @tweet.destroy!
  redirect "/"
end

