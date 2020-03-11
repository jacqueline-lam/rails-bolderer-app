class Send < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  validates_presence_of :user_id, :date_sent
  validates :problem_id, presence: { message: "must be selected" }, uniqueness: { scope: :user_id, message: "can only be sent once" }
  validates :attempts, presence: true, numericality: { greater_than: 0 }
  validate :valid_date?
  # validate :new_problem_sent?, on: create

  def valid_date?
    if date_sent.present? && (date_sent < self.problem.created_at)
      errors.add(:date_sent, "must be after problem set date")
    end
  end

  # def new_problem_sent?
  #   if !!self.user.sends.find_by(problem_id: self.problem_id)
  #     errors.add(:problem_id, "must select a problem which you haven't sent")
  #   end
  # end
end
