class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :trainee_course
  belongs_to :course_subject
  has_many :user_tasks, dependent: :destroy
  after_create :create_activity
  accepts_nested_attributes_for :user_tasks, allow_destroy: true

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