#Log in
get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:user][:username], params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    status 422
    @errors = ["I pity the fool who can't access their account!"]
    erb :'sessions/new'
  end
end

#Log out
delete '/logout' do
  session.delete(:user_id)
  redirect '/'
end
