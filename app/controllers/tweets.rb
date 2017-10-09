get '/tweets' do
  @tweet = Tweet.all
  erb :'tweets/index'
end

get '/tweets/new' do
  @tweet = Tweet.new
  erb :'tweets/new'
end

post '/tweets' do
  @tweet = Tweet.new(params[:tweet])
  @user = User.find_by(id: session[:user_id])

  @tweet.user = @user

  if @tweet.save
    redirect '/tweets'
  else
    erb :'tweets/new'
  end
end

 get '/tweets/:id' do
   @tweet = Tweet.find(params[:id])
   erb :'tweets/show'
 end

 get '/tweets/:id/edit' do
   @tweet = Tweet.find(params[:id])
   erb :'tweets/edit'
 end

 patch '/tweets/:id' do
   @tweet = Tweet.find(params[:id])
   @tweet.update(params[:tweet])
   #@tweet.assign_attributes(params[:tweet])
   #redirect '/tweets/#{@tweet.id}'
   if @tweet.save
     redirect '/tweets'
     #redirect '/tweets'
   else
     erb :'tweets/edit'
   end
 end

 delete '/tweets/:id' do
   @tweet = Tweet.find(params[:id])

   @tweet.destroy

   redirect '/tweets'
 end






