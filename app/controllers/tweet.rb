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
  @tweet = Tweet.create!(:content => params[:content], :user_id => session[:user_id])
  if @tweet.save
    redirect '/tweets/index'
  else
    "Tweet not created"
  end
end

post '/tweets/edit' do
  "To be done"
  #redirect '/tweets/index'
end

post '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @user = User.find_by(id: session[:id])
  if (@tweet && @user == current_user)
    @tweet.destroy
    redirect '/tweets/index'
  else
    "You cannot delete others' tweets"
  end
end
