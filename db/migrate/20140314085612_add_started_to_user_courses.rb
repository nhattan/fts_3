class AddStartedToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :start_at, :datetime, default: nil
  end
end
