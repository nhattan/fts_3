class Admin::TraineesController < ApplicationController
	before_action :signed_in_user
  before_action :admin_user

	def index
		if params[:course_id]
			@course = Course.find params[:course_id]
			@trainee_enroll_courses = @course.user_normal_enrolls.paginate(page: params[:page], per_page: 5)
			@trainee_not_enroll_courses = @course.user_normal_not_enrolls.paginate(page: params[:page], per_page: 5)
		end
	end

	def create		
		if params[:course_id]
			flash[:success] = "Add trainee finish"
			@course = Course.find params[:course_id]
			@course.user_courses.create user_id: params[:id]
			redirect_to admin_course_trainees_url @course
		end
	end

	def destroy
		if params[:course_id]
			flash[:success] = "Remove trainee finish"
			@course = Course.find params[:course_id]
			@course.user_courses.find_by_user_id(params[:id]).destroy
			redirect_to admin_course_trainees_url @course
		end
	end
end