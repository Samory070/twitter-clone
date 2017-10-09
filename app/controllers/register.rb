get '/register' do
  erb :'register'
end

post '/register' do
  new_user = User.new(params[:user])

  if new_user.save
    session[:user_id] = new_user.id
    redirect '/user/:id'
  else
    get_errors(new_user)
    redirect '/register'
  end

end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


