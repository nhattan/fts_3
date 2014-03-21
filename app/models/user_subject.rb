class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  after_create :create_activity

  private
    def create_activity
      Activity.create(object: self, name: 'create', user: user,
        subject_id: subject.id)
    end
end