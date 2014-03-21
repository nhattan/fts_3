class Subject < ActiveRecord::Base
  has_many :activities
  has_many :course_subjects
  has_many :user_subjects
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  accepts_nested_attributes_for :tasks, allow_destroy: true
end