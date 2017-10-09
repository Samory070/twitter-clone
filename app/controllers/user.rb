get '/user/:id' do
  #@user = User.find(id)
  @follow_action = @user.has_followee(current_user)
  erb :'profile'
end

put '/user/:id' do
  #@user = User.find(id)
  @follow_action = @user.has_followee(current_user)
  @user.update(params[:user])
  if
    @user = User.find(params[:id])
  else
    redirect "/user/#{current_user.id}"
  end
end

get '/user/:id/follows' do
  #@user = User.find(id)
  @follow_type = 'follows'
  @followings = @user.follows
  erb :'follower'
end

get '/user/:id/followers' do
  #@user = User.find(id)
  @follow_type = 'followers'
  @followings = @user.followees
  erb :'follower'
end

post '/user/:id/follow' do
  #@user = User.find(id)
  existing_follow = Follower.where(from_user_id: "#{current_user.id}", to_user_id: id)
  # edit this part below
  if existing_follow.count > 0 then existing_follow.first.destroy : Follower.create(from_user_id: "#{current_user.id}", to_user_id: id)

  @follow_action = @user.has_followee(current_user)

  redirect "/user/#{id}"
  end

