class CoursesController < ApplicationController
  before_action :signed_in_user
  before_action :trainee_user
  before_action :correct_user, only: [:show, :update]

  def index
  end

  def show
    @course = Course.find params[:id]
    @trainee_course = current_user.trainee_courses.find_by course_id: @course.id
    @activities = current_user.recent_activities(50)
  end
  
  def update
    trainee = current_user
    if params[:commit] == "Start Course"
      trainee_course = current_user.trainee_courses.find_by course_id: @course.id
      trainee_course.start_at = Date.today.to_s
      @course.course_subjects.each do |course_subject|
        user_subject = trainee_course.user_subjects.build(subject_id: course_subject.subject_id,
          course_subject_id: course_subject.id, user_id: current_user.id)
      end
      if trainee_course.save
        flash[:success] = "Trainee course started"
        else
          flash[:error] = "Started subject error"
        end
      redirect_to user_course_url(current_user, @course)
    end
  end

  private

    def correct_user
      @course = Course.find params[:id]
      trainee_course = current_user.trainee_courses.find_by course_id: @course.id
      if trainee_course.nil?
        flash[:error] = "You not have permit in this course!"
        redirect_to root_url
      end
    end
end
