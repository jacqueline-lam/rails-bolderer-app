class UsersController < ApplicationController
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
end
