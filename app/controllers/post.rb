get '/' do
  redirect '/tweets'
end

get '/posts' do
  @posts = Post.all
end

get '/posts/new' do
  @post = Tweet.new
  erb :"posts/new"
end

post '/posts' do
  @tweet = Tweet.create(params[:tweet])
end
