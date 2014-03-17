class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :validate_password

  has_many :user_courses, dependent: :destroy
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, :length => { :maximum => 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}, if: :validate_password
  validates :password_confirmation, presence: true, if: :validate_password
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
