class Admin::AssignTraineesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  before_action :current_course

  def edit
    @trainee_enrolls = @course.trainee_courses.paginate(page: params[:page], per_page: 5)
    @trainee_not_enrolls = User.trainee_not_enroll_to_courses(@course).paginate(page: params[:page], per_page: 5)
  end

  def create    
    flash[:success] = "Add trainee finish"
    @course.trainee_courses.create user_id: params[:id]
    redirect_to edit_admin_course_assign_trainees_path(@course)
  end

  def destroy
    flash[:success] = "Remove trainee finish"
    @course.trainee_courses.find_by_user_id(params[:id]).destroy
    redirect_to edit_admin_course_assign_trainees_path(@course)
  end

  private
  def current_course
    @course = Course.find params[:course_id]
  end
end