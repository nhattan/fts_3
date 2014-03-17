class Admin::AssignSupervisorsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  before_action :current_course

  def edit
    @admin_enrolls = @course.supervisor_courses.paginate(page: params[:page], per_page: 5)
    @admin_not_enrolls = User.supervisor_not_enroll_to_courses(@course).paginate(page: params[:page], per_page: 5)
  end

  def create  
    flash[:success] = "Add Supervisor finish"
    @course.supervisor_courses.create user_id: params[:id]
    redirect_to edit_admin_course_assign_supervisors_path(@course)
  end

  def destroy
    flash[:success] = "Remove supervisor finish"
    @course.supervisor_courses.find_by_user_id(params[:id]).destroy
    redirect_to edit_admin_course_assign_supervisors_path(@course)
  end

  private
  def current_course
    @course = Course.find params[:course_id]
  end
end