class Send < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  validates :attempts, presence: true, numericality: {greater_than: 0}
  validate :valid_date? 
  validates_presence_of :user_id, :problem_id

  def valid_date?
    if date_sent > self.problem.created_at
      errors.add(:date_sent, "Sent date must be after problem set date")
    end
  end
  
end
