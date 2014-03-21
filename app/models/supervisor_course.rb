class SupervisorCourse < ActiveRecord::Base
  has_paper_trail
  belongs_to :user  
  belongs_to :course
end
