class SendsController < ApplicationController
  # call to the ActionController class method before_action
  # register a filter 
  before_action :get_user, only:[:index, :show, :new, :create, :hardest, :easiest]
  before_action :get_send, only:[:show, :update, :destroy]

  def index
    if @user.nil?
      redirect_to users_path 
    else
      @sends = @user.sort_user_sends_by_date
    end
  end
  
  def show
    
  end
 
  def new
    if @user.nil?
      redirect_to users_path
    else
      @send = Send.new
    end
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
  
  def send_params
    params.require(:send).permit(:problem_id, :user_id, :attempts, :date_sent, :image)
  end
end
