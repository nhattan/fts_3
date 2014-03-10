class AddIndexToUserSubjectsUserIdSubjectId < ActiveRecord::Migration
  def change
  	add_index :user_subjects, :user_id
  	add_index :user_subjects, :subject_id
  end
end
