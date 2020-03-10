class ApplicationController < ActionController::Base
  helper_methods :logged_in, :current_user, :owner_of_sends

  def current_user
    User.find_by(id: session[:user_id]) 
  end
  
  def logged_in?
    !!curent_user
  end

  def require_login
    redirect_to :root unless logged_in?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def owner_of_sends?(user)
    current_user.id == user.id
  end

end
