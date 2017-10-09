get '/tweets' do
  erb :'tweet'
end

post '/tweets' do
  @tweet = Tweet.create(params[:tweet])

  redirect '/tweets'

end

delete '/tweet/:id' do
  @tweet = Tweet.find(id)
  @tweet.destroy

  redirect '/tweets'
end


