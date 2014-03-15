class AddStartedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :start_at, :datetime, default: nil
  end
end
