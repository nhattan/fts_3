class Course < ActiveRecord::Base
  has_many :subjects
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
