class Admin::UsersController < ApplicationController

  before_filter :signed_in_user
  before_filter :correct_user

  def show
    @user = User.find params[:id]
  end

  def index
  end

  def create
  end

  def edit
  	@user = User.find params[:id]
  end

  def update    
    @user = User.find params[:id] 
    
    @user.validate_password = true  
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      @user.validate_password = false
      redirect_to admin_user_path(@user)
    else
      flash[:error] = "input error"
      @user.validate_password = false
      render 'edit'
    end
  end

  def destroy
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    def correct_user
      redirect_to(root_path) unless admin_user?(current_user)
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
