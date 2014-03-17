class Admin::CoursesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
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
    if @course.save
      flash[:success] = "Course created!"
      redirect_to admin_course_url @course
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]

    if params[:commit].to_s == "Start"
      params[:course] = {start_at: Date.today.to_s}
    end

    if params[:course][:course_subject] != nil
      params[:course][:course_subject].each do |_, value|
        if value.to_s != "0"
          @course.user_courses.create user_id: value
        end
      end
    end

    if @course.update_attributes course_params
      flash[:success] = "Updated"
      redirect_to admin_course_url @course
    else
      render 'edit'
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
end