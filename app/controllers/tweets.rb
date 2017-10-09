get '/tweets/new' do
  @tweet = Tweet.new
  erb :"/tweets/new"
end

post '/tweets' do
  @tweet = Tweet.new(user_id: current_user.id, content: params[:tweet][:content])
  if @tweet.save
    redirect "/users/current_user.id"
  else
    @tweet.errors.full_messages
    erb :"/tweets/new"
  end
end