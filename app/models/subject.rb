class Subject < ActiveRecord::Base
  has_many :course_subjects
  has_many :tasks
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
