class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :user_subject_id
      t.boolean :finish

      t.timestamps
    end
  end
end
