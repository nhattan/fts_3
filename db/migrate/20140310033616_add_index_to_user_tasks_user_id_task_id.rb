class AddIndexToUserTasksUserIdTaskId < ActiveRecord::Migration
  def change
  	add_index :user_tasks, :user_id
  	add_index :user_tasks, :task_id
  end
end
