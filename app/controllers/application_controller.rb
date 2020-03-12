class ApplicationController < ActionController::Base
  helper_method :logged_in, :current_user, :log_in, :sender?
  def index
  end
  
  # Helper methods
  def logged_in?
    !!curent_user
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

  def sender?(user)
    current_user.id == user.id
  end

end
