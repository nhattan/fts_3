class UserSubject < ActiveRecord::Base
  has_paper_trail
  belongs_to :user
  belongs_to :subject
end