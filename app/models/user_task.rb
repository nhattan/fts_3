class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :user_subject
  after_create :create_activity

  private
    def create_activity
      Activity.create(object: self, name: 'create', user: user,
        task_id: task.id)
    end
end