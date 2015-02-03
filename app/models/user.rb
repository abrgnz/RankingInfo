class User < ActiveRecord::Base
  has_many :assignments
  has_many :trials, through: :assigments
end
