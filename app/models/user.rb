class User < ApplicationRecord
  has_many :sends
  has_many :problems, through: :sends

  # ActiveRecord macro works in conjunction with ruby gem bcrypt
  # to encrypt password, gives us ability to access attr `password`
  has_secure_password
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  
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

  def self.find_by_omniauth(auth_hash)
    # always return an instance of user just found  
    return self.find_by(github_uid: auth_hash["uid"])
  end
  
  def self.find_or_create_by_omniauth(auth_hash)
    
    self.where(github_uid: auth_hash["info"]["uid"]).first_or_create do |user|
      user.username = auth_hash["info"]["nickname"]
      user.password = SecureRandom.hex
    end
  end
end
