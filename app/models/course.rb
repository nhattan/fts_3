class Course < ActiveRecord::Base
  has_many :subjects, through: :course_subjects
  has_many :activities
  has_many :course_subjects, dependent: :destroy
  has_many :supervisor_courses, dependent: :destroy
  has_many :trainee_courses, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  accepts_nested_attributes_for :course_subjects, allow_destroy: true
end
