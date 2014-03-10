class AddIndexToSubjectsCourseId < ActiveRecord::Migration
  def change
  	add_index :subjects, :course_id
  end
end
