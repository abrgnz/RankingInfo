class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.date :date
      t.text :comment
      t.integer :trial_id

      t.timestamps
    end
  end
end
