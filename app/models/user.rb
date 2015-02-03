class User < ActiveRecord::Base
  has_many :assignments
  has_many :trials, through: :assigments

  has_secure_password
end
