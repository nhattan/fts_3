class CoursesController < ApplicationController
  before_action :signed_in_user
  before_action :trainee_user

  def index
    @user_courses = current_user.user_courses
  end

  def show
    @course = Course.find params[:id]
    @user_course = current_user.user_courses.find_by params[:id]
  end
end
