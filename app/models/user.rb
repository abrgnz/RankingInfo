class User < ActiveRecord::Base

  before_save { username.downcase! }
  has_many :assignments
  has_many :trials, through: :assigments


  validates :username, presence: true
  validates :name, presence: true
  validates :privileges, presence: true
  has_secure_password


  def self.created_today
    where('created_at >= ?', 1.day.ago)
  end

  def self.non_admin(session)
    where('privileges != ? AND id != ?', 1, session)
  end

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_digest)
      user
    else
      nil
    end
  end



end
