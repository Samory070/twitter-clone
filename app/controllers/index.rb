get '/' do
  @tweets = Tweet.all.reverse
  erb :index
end

get '/tweets/new' do
 erb :'tweets/new'
end

post '/tweets' do
   @tweet = Tweet.new(params[:tweet])
   if @tweet.save?

   else

   end
end

get '/tweets/:id' do
  @tweet = Tweet.find_by(id: params[:id])
  if request.xhr?
    erb :'/tweets/_details', layout: false
  else
  erb :'tweets/show'
  end
end



