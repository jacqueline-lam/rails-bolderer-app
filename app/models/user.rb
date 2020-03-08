class User < ApplicationRecord
  # ActiveRecord macro works in conjunction with ruby gem bcrypt
  # to encrypt password, gives us ability to access attr `password`
  has_secure_password
  has_many :sends
  has_many :problems, through: :sends
  has_many :rewards
end
