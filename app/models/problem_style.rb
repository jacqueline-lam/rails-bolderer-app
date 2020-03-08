class ProblemStyle < ApplicationRecord
  belongs_to :problem
  belongs_to :style

  # validates that problem_id can only be assigned a style_id once
  validates :problem_id, uniqueness: { scope: :style_id, message: "Problems can only be given a style once" }
end
