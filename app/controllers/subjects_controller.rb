class SubjectsController < ApplicationController
  before_action :current_course
  before_action :correct_user

  def edit
    @trainee_course = current_user.trainee_courses.find_by course_id: @course.id
    if params[:subject_id].nil?
      @course.course_subjects.each do |course_subject|
        @subject = course_subject.subject if course_subject.subject
      end
    else
      @subject = Subject.find params[:subject_id]
    end
  end

  def update
    @subject = Subject.find params[:subject_id]
    @trainee_course = current_user.trainee_courses.find_by course_id: @course.id
    user_subject = @trainee_course.user_subjects.find_by subject_id: @subject.id
    if params[:commit] == "Start"
      if current_user.trainee_courses.find_by(course_id: @course.id).started?
        ActiveRecord::Base.transaction do
          user_subject.update_attributes start_at: Date.today.to_s
          @subject.tasks.each do |task|
            user_subject.user_tasks.create(task_id: task.id,
              user_id: current_user.id)
          end
        end
        flash[:sucess] = "This subject started!"
        render 'edit'
      else
        flash[:error] = "You didn't start this course!"
        redirect_to @course
      end
    elsif params[:commit] == "Save"
      params[:tasks].each do |task_id, value|
        unless value.to_s == "0".to_s
          user_subject = @trainee_course.user_subjects.find_by subject_id: params[:subject_id]
          task = user_subject.user_tasks.find_by task_id: task_id
          task.update_attributes finish: true
        end
      end
      render 'edit'
    end
  end

  private
  
    def current_course
      @course = Course.find params[:course_id]
    end

    def correct_user
      trainee_course = current_user.trainee_courses.find_by course_id: @course.id
      if trainee_course.nil?
        flash[:error] = "You not have permit to update this course progress!"
        redirect_to root_url
      end
    end
end