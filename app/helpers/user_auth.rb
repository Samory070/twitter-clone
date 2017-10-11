def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end

def owns_tweet?(tweet)
  logged_in? && tweet.user == current_user
end

# def user_tweet?
#   session[user_id] == @user.id && logged_in?
# end

