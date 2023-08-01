class AddRaceToRiders < ActiveRecord::Migration[7.0]
  def change
    add_reference :riders, :race, null: true, foreign_key: true
  end
end
