class UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def create
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
