get '/posts' do
  # "Shows all posts"
  @posts = Post.all
  # @posts.map{|tweet| tweet.tweet}.to_s
  erb :'posts/index'

end


get '/posts/new' do
  # @post = Post.new
  erb :'posts/new'
end

post '/posts' do

  @post = Post.new(body: params[:body])
  if @post.save
    puts "Post Saved"
    redirect "/posts"
  else
    puts "Post NOT saved"
    puts "#{@errors}"
    erb :'posts/new'
  end
end

get '/posts/:id' do
  @posts = Post.find(params[:id])
  erb :'posts/show'
end

get '/posts/:id/edit' do
  "return an HTML form for editing a post"
  @post = Post.find_by(id: params[:id])
  # redirect '/posts' unless own_post?(@post)
  erb :'posts/edit'
end

# Refactor so that other users can't edit
# another users post
put '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  if @post.save
    redirect "/posts"
  else
    erb :"posts/edit"
  end
end

# Refactor so that other users can't delete
# another users post
delete '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  @post.destroy!
  redirect "/posts/delete"
end
