class CreateTraineeCourses < ActiveRecord::Migration
  def change
    create_table :trainee_courses do |t|
      t.integer :user_id
      t.integer :course_id
      t.datetime :start_at
      t.integer :finish

      t.timestamps
    end
  end
end
