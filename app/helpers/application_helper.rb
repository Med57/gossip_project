module ApplicationHelper
  def current_user
    User.find(session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
