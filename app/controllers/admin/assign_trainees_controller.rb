class Admin::AssignTraineesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  before_action :current_course
  before_action :enrolled_course

  def edit
    @trainee_enrolls = @course.trainee_courses
      .paginate(page: params[:page], per_page: 5)
    @trainee_not_enrolls = User.trainee_not_enroll_to_courses(@course)
      .paginate(page: params[:page], per_page: 5)
  end

  def create
    user = User.find params[:id]
    @course.trainee_courses.create user_id: user.id      
    flash[:success] = "Add trainee #{user.name} finish"
    redirect_to edit_admin_course_assign_trainees_path(@course)
  end

  def destroy
    user = User.find params[:id]
    @course.trainee_courses.find_by(user_id: user.id).destroy      
    flash[:success] = "Remove trainee #{user.name} finish"
    redirect_to edit_admin_course_assign_trainees_path @course
  end

  private
  
    def current_course
      @course = Course.find params[:course_id]
    end

    def enrolled_course
      unless @course.supervisor_courses.find_by user_id: current_user.id
        flash[:error] = "You can't assign trainee to this course"
        redirect_to admin_course_url @course
      end
    end
end