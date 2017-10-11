get '/tweets/new' do
  require_user
  erb :'/tweets/new'
end

post '/tweets' do
  "hello"
  puts params
  p "*******************"
  p @tweet = Tweet.new(user_id: current_user.id, message: params[:message])
  if @tweet.save
  	#redirect to users page(session)
  else
  	@errors = @tweet.errors.full_messages
  	#display errors in erb file
  	erb :'tweets/new'
  end
end

get 'tweets/:id' do
	@tweet = Tweet.find_by(id:params[:id])
	#add error handle to redirect if tweet.user_id doesnt match
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
