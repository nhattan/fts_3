class Admin::SubjectsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def index
    @subjects = Subject.order(:name)
  end

  def show
    @subject = Subject.find params[:id]
    @tasks = @subject.tasks
    @task = Task.new
  end

  def new
    @subject = Subject.new
    4.times do
      task = @subject.tasks.build
    end
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = "Subject created!"
      redirect_to admin_subjects_url
    else
      render 'new'
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    subject = Subject.find params[:id]
    if subject.update_attributes subject_params
      flash[:success] = "Updated!"
      redirect_to admin_subjects_url
    else
      render 'edit'
    end
  end

  def destroy
    subject = Subject.find params[:id]
    subject.destroy
    flash[:success] = "Deleted!"
    redirect_to admin_subjects_url
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :description, 
        tasks_attributes:[:id, :name, :description])
    end
end
