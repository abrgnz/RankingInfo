class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :description
      t.string :title
      t.boolean :done
      t.timestamps
    end
  end
end
