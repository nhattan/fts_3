class UserTask < ActiveRecord::Base
  has_paper_trail
  belongs_to :user
  belongs_to :task
end