class ApplicationController < ActionController::Base
  include ApplicationHelper

  def authenticate_user
    unless session[:user_id] && current_user
      @user = User.new
      render new_session_path
    end
  end
end
