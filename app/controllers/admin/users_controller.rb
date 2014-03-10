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
end
