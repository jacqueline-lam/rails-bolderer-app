class User < ApplicationRecord
  has_many :sends
  has_many :problems, through: :sends

  # ActiveRecord macro works in conjunction with ruby gem bcrypt
  # to encrypt password, gives us ability to access attr `password`
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

  def hardest_send
    user_problems = self.problems
    if user_problems.any?
      return user_problems.order('grade desc').limit(1).first.grade 
    else
      return "#{self.username} has not logged any sends." 
    end
  end

  def sort_user_sends_by_date
    self.sends.order('date_sent desc')
  end

  def self.find_by_omniauth(auth_hash)
    # always return an instance of user just found  
    return self.find_by(github_uid: auth_hash["uid"])
  end
end
