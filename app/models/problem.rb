class Problem < ApplicationRecord
  belongs_to :wall
  has_many :sends
  has_many :users, through: :sends
  has_many :problem_styles
  has_many :styles, through: :problem_styles

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
  
  # Query Problem table for all problem instances
  def self.problems_by_date
    Problem.all.order('date desc')
  end

end