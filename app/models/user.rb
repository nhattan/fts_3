class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :validate_password

  has_many :activities
  def recent_activities(limit)
    activities.order('created_at DESC').limit(limit)
  end
  has_many :event_logs
  has_many :trainee_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, :length => { :maximum => 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}, if: :validate_password
  validates :password_confirmation, presence: true, if: :validate_password

  scope :trainee_not_enroll_to_courses, lambda { |course|
    sql = "(SELECT user_id FROM trainee_courses WHERE course_id = #{course.id})"
    User.where("users.id NOT IN #{sql} and users.supervisor == 0")
  }
  
  scope :supervisor_not_enroll_to_courses, lambda { |course|
    sql = "(SELECT user_id FROM supervisor_courses WHERE course_id = #{course.id})"
    User.where("users.id NOT IN #{sql} and users.supervisor > 0")
  }

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
