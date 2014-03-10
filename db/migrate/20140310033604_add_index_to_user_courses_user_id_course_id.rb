class AddIndexToUserCoursesUserIdCourseId < ActiveRecord::Migration
  def change
  	add_index :user_courses, :user_id
  	add_index :user_courses, :course_id
  end
end
