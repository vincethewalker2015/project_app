class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #@project.user = User.first
    session[:user_id] = @user.id
    if @user.save
      flash[:success] = "Profile has been created"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Oops! that didn't work.. Lets try that again :)"
      render 'new'
    end
  end
  
  def show
   #partial rendered as set_user
  end
  
  def edit
    
  end
  
  def update
    
    if @user.update(user_params)
      flash.now[:success] = "Your Details have been updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def destroy
     
     @user.destroy
     session[:user_id] = nil
     flash.now[:success] = "User has been deleted"
     redirect_to users_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end