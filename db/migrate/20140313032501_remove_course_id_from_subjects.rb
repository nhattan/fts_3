class RemoveCourseIdFromSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :course_id, :integer
  end
end
