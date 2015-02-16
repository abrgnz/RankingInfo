class Task < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  validates :user_id, presence: true


  def self.created_today
    where('created_at >= ?', 1.day.ago)
  end

  def self.task_not_done(session,privileges)
    privileges == "1"? where("done = 'f'") : where("user_id = ? AND done = 'f'",session)
  end

  def self.task_done(session,privileges)
    privileges == "1"? where("done = 't'") : where("user_id = ? AND done = 't'",session)
  end


end
