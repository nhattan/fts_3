class CoursesController < ApplicationController
  before_action :signed_in_user
  before_action :trainee_user

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
    @user_course = current_user.user_courses.find params[:id]
  end
end
