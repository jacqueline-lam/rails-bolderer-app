class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :log_in, :validate_user, :require_login, :require_logout
  def index
  end
  
  # Helper methods
  def validate_user
    if !get_user
      flash[:alert] = "This user doesn't exist. Please check out other users."
      redirect_to users_path 
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end
  
  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      flash[:alert] = "Please login/ create account to view this page."  
      redirect_to :root 
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def require_logout
    if logged_in?
      flash[:alert] = "Please log out of your account first."  
      redirect_to problems_path 
    end
  end
end
