class TrialAlert < ActiveRecord::Base
  belongs_to :trial
  def self.notifications(session)
    TrialAlert.where('user_id = ?',session)
  end
end
