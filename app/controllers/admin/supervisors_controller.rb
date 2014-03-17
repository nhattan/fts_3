class Admin::SupervisorsController < ApplicationController
	before_action :signed_in_user
  before_action :admin_user

	def index
		@course = Course.find params[:course_id]
		@user_admin_enrolls = @course.user_admin_enrolls.paginate(page: params[:page], per_page: 5)
		@user_admin_not_enrolls = @course.user_admin_not_enrolls.paginate(page: params[:page], per_page: 5)
	end

	def create		
		if params[:course_id]
			flash[:success] = "Add Supervisor finish"
			@course = Course.find params[:course_id]
			@course.user_courses.create user_id: params[:id]
			redirect_to admin_course_supervisors_url @course
		end
	end

	def destroy
		if params[:course_id]
			flash[:success] = "Remove supervisor finish"
			@course = Course.find params[:course_id]
			@course.user_courses.find_by_user_id(params[:id]).destroy
			redirect_to admin_course_supervisors_url @course
		end
	end
end