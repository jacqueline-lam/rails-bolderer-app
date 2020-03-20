class Problem < ApplicationRecord
  belongs_to :wall
  has_many :sends
  has_many :users, through: :sends
  has_many :problem_styles
  has_many :styles, through: :problem_styles
  validates_presence_of :name, :color, :grade
  # Query Problem table for all problem instances
  scope :sort_by_date, -> { order('created_at desc') }
  scope :sort_by_grade, -> { order('grade desc') } 
  
  # scope :filter_by_grades -> (min_grade, max_grade) { where(grade: (min_grade..max_grade)) }
  # scope :filter_by_style -> (selected_style) { where(style: selected_style) }
  # scope :filter_by_wall -> (selected_wall) { where(wall_id: selected_wall ) }


  # Constants for colors + grades as a single source of truth
  # If we ever need to change colors, we can do so here
  # other places it's referenced will updated as well
  COLORS = [
    "White",
    "Red",
    "Orange",
    "Yellow",
    "Green",
    "Lime",
    "Blue",
    "Pink",
    "Purple",
    "Black"
  ]

  GRADES = [
    "V0",
    "V1",
    "V2",
    "V3",
    "V4",
    "V5",
    "V6",
    "V7",
    "V8",
    "V9",
    "V10",
    "V11",
    "V12",
    "V13"
  ]

  def convert_created_at_to_date
    self.created_at.in_time_zone("Eastern Time (US & Canada)").to_date
  end
end