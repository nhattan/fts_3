class Course < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  accepts_nested_attributes_for :course_subjects, allow_destroy: true
end
