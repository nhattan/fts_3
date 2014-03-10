class UsersController < ApplicationController

  before_filter :signed_in_user

  def show
    @user = User.find params[:id]
  end

  def index
  end

  def create
  end

   def edit
  	#redirect_back_or current_user
    @user = User.find params[:id]
    redirect_to root_path unless current_user? @user
  end

  def destroy
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
end
