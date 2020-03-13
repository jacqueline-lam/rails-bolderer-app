class SessionsController < ApplicationController
  before_action :require_logout, only: [:new, :create]
  
  def new
  end

  def create
    # Omniauth stores all the data sent me within this request in the hash
    # If this object exists, user loggeed in via Oauth, else login normally
    if auth_hash = request.env["omniauth.auth"]
      # Person is 100% trusted coming from GitHub
      # find or create them in db by uid
      user = User.find_or_create_by_omniauth(auth_hash)
      binding.pry
      log_in(user)

      redirect_to problems_path
    else 
      # Normal Login with Username and Password
      # Locally authenticate user - verify they exist in db by username
      user = User.find_by(username: params[:username])
      # and that password matches hashed password in db
      # if it does, log them in with session hash
      if user && user.authenticate(params[:password])
        log_in(user)
        redirect_to user_path(user)
      else
        @error = "Invalid username or password. Please try again."
        render :new
      end
    end
  end

  def destroy
    session.clear if session[:user_id]
    redirect_to :root 
  end
end
