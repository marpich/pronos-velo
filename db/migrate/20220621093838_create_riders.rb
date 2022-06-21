class CreateRiders < ActiveRecord::Migration[6.1]
  def change
    create_table :riders do |t|
      t.string :first_name
      t.string :last_name
      t.string :team
      t.string :nationality
      t.integer :bib

      t.timestamps
    end
  end
end
