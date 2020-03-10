class SendsController < ApplicationController
  def index
    get_user
    @sends = get_user.sort_user_sends_by_date
    # @sends = @user.sends
  end
  
  def show
    get_user
    @send = Send.find_by(params[:id])
  end

  def new
    get_user
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
