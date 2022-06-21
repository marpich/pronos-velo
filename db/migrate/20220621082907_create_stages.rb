class CreateStages < ActiveRecord::Migration[6.1]
  def change
    create_table :stages do |t|
      t.date :date
      t.string :type
      t.float :length
      t.integer :number
      t.string :image_map
      t.string :departure
      t.string :arrival

      t.timestamps
    end
  end
end
