class SessionsController < ApplicationController
  before_action :require_logout, only: [:new, :create]
  
  def new
  end

  def create
    # authenticate user - verify they exist in db by username
    # and that password matches hashed password in db
    # if it does, log them in with session hash
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to user_path(user)
    else
      @error = "Invalid username or password. Please try again."
      render :new
    end
  end

  def destroy
    session.clear if session[:user_id]
    redirect_to :root 
  end
end
