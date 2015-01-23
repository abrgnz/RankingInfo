class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.date :date
      t.text :comment
      t.integer :trial_id

      t.timestamps
    end
  end
end
