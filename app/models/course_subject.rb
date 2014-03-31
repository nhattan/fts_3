class CourseSubject < ActiveRecord::Base
  has_paper_trail
  belongs_to :course
  belongs_to :subject

  def started?
    start_at.present?
  end
end
