class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def completed
    self.complete = true
  end
end
