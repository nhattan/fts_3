class UserSubjectsController < ApplicationController
  before_action :load_object
  before_action :correct_user

  def edit
  end
  
  def update
    if params[:commit] == "Start"
      unless @user_subject.started?
        @user_subject.start_at = Date.today.to_s
        @user_subject.subject.tasks.each do |task|
          @user_subject.user_tasks.build(task_id: task.id,
            user_id: current_user.id)
        end
        if @user_subject.save
          flash[:success] = "This subject is started!"
        else
          flash[:error] = "Started subject error"
        end
      end
    else
      @user_subject.update_attributes user_subject_params
    end
    render 'edit'
  end

  private
  
    def user_subject_params
      params.require(:user_subject).permit(:start_at,  
        user_tasks_attributes:[:id, :user_id, :task_id, :user_subject_id, :finish])
    end

    def load_object
      @trainee_course = current_user.trainee_courses.find params[:trainee_course_id]
      @user_subject = current_user.user_subjects.find params[:id]
    end

    def correct_user
      if @trainee_course.nil?
        flash[:error] = "You not have permit to update this course progress!"
        redirect_to root_url
      end
    end
end