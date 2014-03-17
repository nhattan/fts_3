class CreateSupervisorCourses < ActiveRecord::Migration
  def change
    create_table :supervisor_courses do |t|
      t.integer :user_id
      t.integer :course_id      
      t.datetime :start_at

      t.timestamps
    end

    add_index :supervisor_courses, :user_id
    add_index :supervisor_courses, :course_id
  end
end
