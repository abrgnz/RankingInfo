class Task < ActiveRecord::Base
  has_many :task_alerts
  has_many :users, through: :task_alerts
end
