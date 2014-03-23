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
      flash[:success] = "Trainee course started"
      trainee_course = current_user.trainee_courses.find_by course_id: @course.id
      ActiveRecord::Base.transaction do
        trainee_course.update_attributes start_at: Date.today.to_s
        @course.course_subjects.each do |subject|
          user_subject = trainee_course.user_subjects.create(subject_id: subject.id,
            user_id: current_user.id)
        end
      end
      redirect_to course_url @course
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
