class AddIndexToTasksSubjectId < ActiveRecord::Migration
  def change
  	add_index :tasks, :subject_id
  end
end
