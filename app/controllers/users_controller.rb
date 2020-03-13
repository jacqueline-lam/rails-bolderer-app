class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index]
  before_action :validate_user, only: [:show]
  before_action :require_logout, only: [:new, :create]

  def index
    @users = User.all
    @best_climber = User.best_climber
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to problems_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private 
  # Avoid others from passing in unsavory attributes into our form
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
  
  def validate_user
    redirect_to users_path unless User.find_by(id: params[:id])
  end
end
