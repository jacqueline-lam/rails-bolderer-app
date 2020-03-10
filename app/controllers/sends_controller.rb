class SendsController < ApplicationController
  def index
    get_user
    # @sends = @user.sends
  end
  
  def show
    
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private 
  def get_user
    # returns @user or find user and set the instance variable 
    @user ||= User.find_by(params[:user_id])
  end
end
