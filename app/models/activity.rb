class Activity < ActiveRecord::Base
  belongs_to :object, polymorphic: true
  belongs_to :user

  def in_course?
    self.object_type == "UserCourse"
  end

  def in_report?
    self.object_type == "Report"
  end

  def creating
    self.name == "create"
  end
  
  def updating
    self.name == "update"
  end
end
