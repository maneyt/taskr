class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def self.not_completed
    where(complete: false)
  end
end
