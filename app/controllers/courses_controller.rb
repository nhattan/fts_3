class CoursesController < ApplicationController
  before_action :signed_in_user
  before_action :trainee_user

  def show
    @course = Course.find params[:id]
    @trainee_course = current_user.trainee_courses.find_by course_id: params[:id]
    redirect_to root_url if @trainee_course.nil?
  end
end
