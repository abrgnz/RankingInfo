class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :trial


  def self.expire
    where('created_at >= ? OR updated_at >= ?',5.day.ago, 5.day.ago).limit(15)
  end

end
