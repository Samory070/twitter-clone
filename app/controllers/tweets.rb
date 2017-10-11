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
  @tweet.user = current_user
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
   redirect '/' unless @tweet.user == current_user
   erb :'tweets/edit'
 end

 patch '/tweets/:id' do
   @tweet = Tweet.find(params[:id])
   @tweet.user = current_user
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






