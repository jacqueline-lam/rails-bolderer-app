class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :log_in
  def index
  end
  
  # Helper methods
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end
  
  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to :root unless logged_in?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def require_logout
    redirect_to problems_path unless session[:user_id].nil?
  end
end
