class CreateTaskAlerts < ActiveRecord::Migration
  def change
    create_table :task_alerts do |t|
      t.integer :task_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
