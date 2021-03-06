class User < ApplicationRecord
  has_many :sends
  has_many :problems, through: :sends

  # ActiveRecord macro works in conjunction with ruby gem bCrypt
  # to encrypt password, gives us ability to authenticate user login credentials securely
  has_secure_password
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  # query user table for user who climbed the hardest graded problem 
  scope :best_climber, -> { 
    joins(:problems).order('grade desc')
    .joins(:sends).where('sends.date_sent BETWEEN ? AND ?', Time.zone.today.beginning_of_month, Time.zone.today + 1.day)
    .distinct.limit(1).first 
  }
  scope :top_three, -> {
    joins(:sends)
    .where('sends.date_sent BETWEEN ? AND ?', Time.zone.today.beginning_of_month, Time.zone.today + 1.day)
    .group('user_id')
    .order('count(user_id) DESC')
  }
  
  def favorite_sends
    # SQLite: Boolean values are stored as integers 0 (false) and 1 (true)
    self.sends.where('favorite = ?', 1).order('date_sent desc')
  end

  def hardest_send
    user_problems = self.problems
    if user_problems.any?
      return user_problems.order('grade desc').limit(1).first.grade 
    else
      nil 
    end
  end

  def sort_user_sends_by_date
    self.sends.order('date_sent desc')
  end

  def self.find_by_omniauth(auth_hash)
    # always return an instance of user just found  
    self.find_by(github_uid: auth_hash["uid"])
  end
end
