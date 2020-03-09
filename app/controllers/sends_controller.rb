class SendsController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])
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
end
