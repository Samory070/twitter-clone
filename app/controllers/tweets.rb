get '/tweets' do
  redirect "/"
end

get '/tweets/new' do
  current_user
  redirect '/' unless authorized?(current_user)
  erb :'tweets/new'
end

post 'tweets' do
# Figure out if this current user is necessary
  current_user
  @new_tweet = Tweet.new (body: params[:body],
                          user: current_user)
  if @new_tweet.save
    redirect '/'
  else
    @errors = @new_tweet.errors.full_messages
    erb :'tweets/new'
  end
end

get 'tweets/:id/edit' do
  @tweet = Tweet.find_by(id: params[:id])
  redirect "/" unless owns_tweet?(@tweet)
  erb :'tweets/edit'
end

put "/tweets/:id"
# Do I need to declare @current_user in order for this to work properly?
  current_user
  @tweet = Tweet.find_by(id: params[:id])
  redirect '/' unless @tweet/user == current_user
  # Does this params work? Look into exact call
  @tweet.assign_attributes(params[:tweet])
  if @tweet.save
    redirect "/"
  else
    "FIgure out what when wrong!"
  end
end
