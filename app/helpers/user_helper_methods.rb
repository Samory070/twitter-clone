def current_user
  @current_user ||= User.find_by(id: seesion[:user_id])
end

def logged_in?
  !!current_user
end

def authorized?(possible_user)
  logged_in? && current_user == possible_user
end

def own_post?(post)
  logged_in? && post.user == current_user
end


