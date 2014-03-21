class AddAttributesToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :course_id, :integer
    add_column :activities, :subject_id, :integer
    add_column :activities, :task_id, :integer
  end
end
