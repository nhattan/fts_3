class CreateUserSubjects < ActiveRecord::Migration
  def change
    create_table :user_subjects do |t|
      t.integer :user_id
      t.integer :subject_id
      t.integer :trainee_course_id
      t.datetime :start_at
      t.boolean :finish

      t.timestamps
    end
  end
end
