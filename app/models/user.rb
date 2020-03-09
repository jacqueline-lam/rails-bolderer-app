class User < ApplicationRecord
  # ActiveRecord macro works in conjunction with ruby gem bcrypt
  # to encrypt password, gives us ability to access attr `password`
  has_secure_password
  has_many :sends
  has_many :problems, through: :sends
  
  def hardest_send
    # self.problems.order('grade desc').limit(1).grade
    self.problems.maximum('grade')
  end
end
