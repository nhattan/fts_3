class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :trainee_user

  def show
    @user = User.find params[:id]
  end

  def index
  end

  def create
  end

  def edit
    @user = User.find params[:id]
    unless current_user? @user
      flash[:error] = "You can't edit this user"
      redirect_to root_path
    end
  end

  def update
    @user = User.find params[:id] 
    @user.validate_password = true   
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to admin_user_path(@user)
    else
      flash[:error] = "input error"
      render 'edit'
    end
  end

  def destroy
    redirect_to root_url
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
