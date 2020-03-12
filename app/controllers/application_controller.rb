class ApplicationController < ActionController::Base
  helper_method :logged_in, :current_user, :log_in, :sender?
  def index
  end
  
  # Helper methods
  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end

  def require_login
    redirect_to :root unless logged_in?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def require_logout
    redirect_to problems_path unless session.empty? 
  end
end
