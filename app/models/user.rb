class User < ApplicationRecord
  # ActiveRecord macro works in conjunction with ruby gem bcrypt
  # to encrypt password, gives us ability to access attr `password`
  has_secure_password
  has_many :sends
  has_many :problems, through: :sends
  
  def self.best_climber
    # User.find_by()
  end

  def best_climber
    # user who climbed the most hardest graded problem 
  end

  def hardest_send
    self.problems.order('grade desc').limit(1).first.grade
  end

  def sort_user_sends_by_date
    self.sends.order('date_sent desc')
  end
end
