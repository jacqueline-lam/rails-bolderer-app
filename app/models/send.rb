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

  scope :sort_sends_by_color, -> (id, selected_color) {
    sort_by_date.where(user_id: id).joins(:problem).where('problems.color = ?', selected_color)
  }

  # scope :filter_by_wall -> (selected_wall) { where(wall_id: selected_wall ) }
  # scope :filter_by_grades -> (min_grade, max_grade) { where(grade: (min_grade..max_grade)) }
  # scope :filter_by_style -> (selected_style) { where(style: selected_style) }
  
  # Custom method to verify the state of Send model 
  # Validate send.date_sent > send.problem.created_at date
  def valid_date?
    if date_sent.present? && self.problem.present? && (date_sent < self.problem.convert_created_at_to_date)
      # add message to the errors collection
      errors.add(:date_sent, "must be on or after problem set date")
    end
  end  
end
