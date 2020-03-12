class Send < ApplicationRecord
  belongs_to :user
  belongs_to :problem

  validates_presence_of :user_id, :date_sent
  validates :problem_id, presence: { message: "must be selected" }, uniqueness: { scope: :user_id, message: "can only be sent once" }
  validates :attempts, presence: true, numericality: { greater_than: 0 }
  validate :valid_date?
  
  scope :sort_by_date, -> { order('date_sent desc') }
  scope :sort_by_grade_desc, -> (user) {
    where(user_id: user).joins(:problem).order('grade desc')
  } 
  scope :sort_by_grade_asc, -> (user) {
    where(user_id: user).joins(:problem).order('grade asc')
  } 
  # scope :filter_by_grades -> (min_grade, max_grade) { where(grade: (min_grade..max_grade)) }
  # scope :filter_by_style -> (selected_style) { where(style: selected_style) }
  # scope :filter_by_wall -> (selected_wall) { where(wall_id: selected_wall ) }

  def valid_date?
    if date_sent.present? && self.problem.present? && (date_sent < self.problem.created_at)
      errors.add(:date_sent, "must be after problem set date")
    end
  end
end
