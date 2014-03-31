class Admin::CoursesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  before_action :enrolled_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
    @activities = @course.activities
  end

  def new
    @course = Course.new
    @subjects = Subject.all
    @subjects.each do |subject|
      @course.course_subjects.build subject_id: subject.id
    end
  end

  def create
    @course = Course.new course_params    
    @course.course_subjects.each do |course_subject|
      if course_subject.subject_id.nil?
        course_subject.destroy
      end
    end
    ActiveRecord::Base.transaction do
      @course.save
      @course.supervisor_courses.create user_id: current_user.id
      flash[:success] = "Course created!"
    end
    redirect_to admin_course_url @course
  end

  def edit
    @course = Course.find params[:id]
    (Subject.all - @course.subjects).each do |subject|
      @course.course_subjects.build subject: subject
    end
  end

  def update    
    @course = Course.find params[:id]
    if params[:commit].to_s == "Start"
      params[:course] = {start_at: Date.today.to_s}
    end

    if @course.update_attributes course_params
      flash[:success] = "Course updated!"
      redirect_to admin_course_url @course
    else
      render 'edit'
    end
    @course.course_subjects.each do |course_subject|
      if course_subject.subject_id.nil?
        course_subject.destroy
      end
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash[:success] = "Course deleted"
    redirect_to admin_courses_url
  end

  private

    def course_params
      params.require(:course).permit(:name, :description, :start_at,  
        course_subjects_attributes: [:id, :course_id, :subject_id])
    end
    
    def enrolled_course
      @course = Course.find params[:id]
      unless @course.supervisor_courses.find_by user_id: current_user.id
        flash[:error] = "You can't edit/destroy this course"
        redirect_to admin_courses_url
      end
    end
end