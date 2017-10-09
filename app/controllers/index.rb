get '/' do
  erb :index
end

get '/users' do
  "display a list of all users"
end

get '/users/new' do
  "return an html form for creating a new user"
end

post '/users' do
  "create a new user"
end

get '/users/:id' do
  "display a specific user"
end

get '/users/:id/edit' do
  "return an HTML form for editing a user"
end

put '/users/:id' do
  "put route to update a specific user"
end

delete '/users/:id' do
  "Delete Route to delete a specific user"
end
