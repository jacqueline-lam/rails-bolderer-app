class SendsController < ApplicationController
  # call to the ActionController class method before_action
  # register a filter 
  before_action :get_user, only:[:index, :show, :new]
  before_action :get_send, only:[:show, :update, :delete]

  def index
    @sends = @user.sort_user_sends_by_date
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

  def get_send
    # returns @user or find user and set the instance variable 
    @send ||= Send.find_by(params[:id])
  end
end
