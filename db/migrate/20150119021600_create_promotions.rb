class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.date :date
      t.text :comment

      t.timestamps
    end
  end
end
