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
    "User not created"
  end
end
