class TraineeCourse < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  after_create :create_activity
  after_update :update_activity

  private
    def create_activity
      Activity.create(object: self, name: 'create', user: user, 
        course_id: course.id)
    end

    def update_activity
      Activity.create(object: self, name: 'update', user: user,
        course_id: course.id)
    end
end
