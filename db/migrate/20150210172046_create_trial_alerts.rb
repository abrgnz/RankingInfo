class CreateTrialAlerts < ActiveRecord::Migration
  def change
    create_table :trial_alerts do |t|
      t.integer :trial_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
