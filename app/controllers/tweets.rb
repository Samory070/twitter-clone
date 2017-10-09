get '/tweets' do
  @tweets = Tweet.all
  @user = User.find_by(id: session[:id])
  erb :'/tweets/index'
end

get '/tweets/new' do
  erb :'/tweets/new'
end

post '/tweets' do
  @tweet = Tweet.new(params[:tweet])
  if @tweet.save
    redirect '/tweets'
  else
    erb :'/tweets/new'
  end
end

get '/tweets/:id' do
  @user = User.find_by(id: session[:id])
  @tweet = Tweet.find(params[:id])
  erb :'/tweets/show'
end

get '/tweets/:id/edit' do
  @tweet = Tweet.find(params[:id])
  erb :'tweets/edit'
end

put '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.assign_attributes(params[:tweet])
  if @tweet.save
    redirect '/tweets'
  else
    erb :'/tweets/edit'
  end
end

delete '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.destroy
  redirect '/tweets'
end