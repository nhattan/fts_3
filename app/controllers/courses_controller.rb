class CoursesController < ApplicationController
  before_action :signed_in_user
  before_action :trainee_user

  def show
    @course = Course.find params[:id]
    @user_course = current_user.user_courses.find_by id: params[:id]
    redirect_to root_url if @user_course.nil?
  end
end
