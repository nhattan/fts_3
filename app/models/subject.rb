class Subject < ActiveRecord::Base
  belongs_to :course
  has_many :tasks
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
