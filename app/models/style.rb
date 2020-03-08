class Style < ApplicationRecord
  has_many :problem_styles
  has_many :problems, through: :problem_styles
end
