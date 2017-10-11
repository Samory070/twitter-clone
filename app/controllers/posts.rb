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
   @post = Post.find(params[:id])
  erb :'posts/edit'
end

# Tried to implement the update feature as we 
# we over in class today.
# Ran into issues so tried to use pry & use puts statments to debug
# I think this issue might be caused by some of the logic 
# in my earlier written code and the structure of the database. 

put '/posts/edit' do
  binding.pry
  puts @post = Post.find(params[:id])
  erb :'/posts'
end
