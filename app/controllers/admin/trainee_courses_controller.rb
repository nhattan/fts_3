class Admin::TraineeCoursesController < ApplicationController

  def update    
    course = Course.find params[:course_id]
    if params[:finish]
      trainee_course = course.trainee_courses.find params[:id]
      trainee_course.update_attributes finish: params[:finish]
      flash[:success] = "Accept user #{trainee_course.user.name} finish this course!"
    end
    redirect_to admin_course_url(course)
  end

end