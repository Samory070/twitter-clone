get '/posts' do
  # "Shows all posts"
  @posts = Post.all
  @posts.map{|tweet| tweet.tweet}.to_s

  erb :'posts/index'

end


get '/posts/new' do
  "return an HTML form for creating a new post"
  # @post = Post.new
  erb :'posts/new'
end

post '/posts' do
  # "create a new post"
  # puts "create a new post"
  # puts "#{params[:post]}"
  "creates post action"
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  # @post.id
  erb :'posts/show'
end

get '/posts/:id/edit' do
  "return an HTML form for editing a post"
end

put '/posts/:id' do
  "Update a specific post"
end

delete '/posts/:id' do
  "delete a specifc post"
end
