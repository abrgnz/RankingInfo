class CreateGenericImages < ActiveRecord::Migration
  def change
    create_table :generic_images do |t|
      t.string :name
      t.string :description
      t.integer :generic_id

      t.timestamps
    end
  end
end
