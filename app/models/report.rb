class Report < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
  after_create :create_activity

  private
    def create_activity
      Activity.create(object: self, name: 'create', user: user)
    end
end
