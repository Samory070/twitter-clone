get '/tweets/new' do
  erb :'/tweets/new'
end

post '/tweets' do
  "hello"
  puts params
  p "*******************"
  p @tweet = Tweet.new(params[:message])

end
