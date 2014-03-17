class Course < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  accepts_nested_attributes_for :course_subjects, allow_destroy: true
  #accepts_nested_attributes_for :course_users, allow_destroy: true

  def user_admin_enrolls
    User.joins("JOIN user_courses ON users.id = user_courses.user_id")
      .where("user_courses.course_id = ? AND users.supervisor > 0", id)
  end
  
  def user_normal_enrolls
    User.joins("JOIN user_courses ON users.id = user_courses.user_id")
      .where("user_courses.course_id = ? AND users.supervisor = 0", id)
  end
  
  def user_normal_not_enrolls
    sql = "(SELECT user_id FROM user_courses WHERE course_id = #{id})"
    User.where("users.id NOT IN #{sql} and users.supervisor == 0")
  end

  def user_admin_not_enrolls
    sql = "(SELECT user_id FROM user_courses WHERE course_id = #{id})"
    User.where("users.id NOT IN #{sql} and users.supervisor > 0")
  end
end
