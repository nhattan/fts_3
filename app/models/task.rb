class Task < ActiveRecord::Base
  belongs_to :subject
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
end
