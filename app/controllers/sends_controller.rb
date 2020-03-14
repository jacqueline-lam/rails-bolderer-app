class SendsController < ApplicationController
  # call to the ActionController class method before_action
  # register a filter 
  before_action :require_login
  before_action :get_user, only:[:index, :show, :new, :create, :hardest, :easiest]
  before_action :get_send, only:[:show, :edit, :update, :destroy]
  before_action :validate_user
  before_action :validate_sender, only: [:new, :create, :edit, :update, :destroy]
  before_action :no_sends?, only: [:index, :show]
  before_action :validate_send_id, only: [:show, :update, :destroy]
  # before_action :validate_sender, only: [:new, :create]

  def index
    @sends = @user.sort_user_sends_by_date
  end
  
  def show

  end
 
  def new
    @send = Send.new
  end

  def create
    # user that I want to associate with this send
    # shielding data by assigning send's user_id here instead of via hidden_field in view form
    @send = current_user.sends.build(send_params)
    if @send.save #if able to run validations
      redirect_to user_sends_path(@send.user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    # if current_user == send.user
   @send.destroy
   redirect_to user_sends_path(@send.user)
  end

  def easiest
    @sends = Send.sort_by_grade_desc(@user.id)
    render :index
  end

  def hardest
    @sends = Send.sort_by_grade_asc(@user.id)
    render :index
  end

  private 
  def get_user
    # returns @user or find user and set the instance variable 
    @user ||= User.find_by(id: params[:user_id])
  end

  def get_send
    # returns @user or find user and set the instance variable 
    @send ||= Send.find_by(id: params[:id])
  end
 
  def validate_sender
    validate_user
    if current_user != get_user
      flash[:alert] = "You're not authroized to create/ update this user's sends!"  
      redirect_to user_sends_path(get_user) 
    end
  end

  def validate_send_id
    if !get_send
      flash[:alert] = "This send doesn't exist. Please check out other sends by #{get_user.username}."  
      redirect_to user_sends_path(get_user)
    end
  end

  def no_sends?
    if @user.sends.empty?
      flash[:alert] = "#{get_user.username} user has not logged any sends yet."  
      redirect_to user_path(get_user) 
    end
  end

  def send_params
    params.require(:send).permit(:problem_id, :user_id, :attempts, :date_sent, :image)
  end
end
