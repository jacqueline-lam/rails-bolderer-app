class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index]
  before_action :validate_user, only: [:show]
  before_action :get_user, only: [:show]
  before_action :require_logout, only: [:new, :create]

  def index
    @users = User.all
    @red_point_winners = User.top_three
    @best_climber = User.best_climber
  end

  def new 
    @user = User.new
  end

  def create
    # Tell Rails what parameters are allowed to be submitted through the form to db
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to problems_path
    else
      render :new
    end
  end

  def show
  end
  
  private 
  # Strong params avoid others from passing in unsavory attributes into our form
  # Private method to encapsulate permissible parameters
    # permit list between create and update
  def user_params
    # params that get passed in must contain a key 'user', permit optional keys
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
  
  def get_user
    # returns @user or find user and set the instance variable 
    @user ||= User.find_by(id: params[:id])
  end
end
