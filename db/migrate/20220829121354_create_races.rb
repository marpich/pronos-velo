class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :year
      t.date :starting_date
      t.date :ending_date

      t.timestamps
    end
  end
end
