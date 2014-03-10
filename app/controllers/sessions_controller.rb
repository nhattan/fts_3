class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email params[:session][:email].downcase
	if user && user.authenticate(params[:session][:password])		
		sign_in user
		if admin_user?(user) == true
			redirect_to admin_user_path user
		else
			redirect_to user
		end
	else
		flash.now[:error] = 'Invalid email/password combination'
		render 'new'
	end
  end

  def destroy
  	sign_out
	redirect_to root_path
  end
end
