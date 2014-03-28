class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :trainee_course
  has_many :user_tasks, dependent: :destroy
  after_create :create_activity

  def finish?
    finish
  end
  def started?
    !start_at.nil?
  end

  private
    def create_activity
      Activity.create(object: self, name: 'create', user: user,
        subject_id: subject.id)
    end
end