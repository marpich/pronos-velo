class AddRaceRefToStages < ActiveRecord::Migration[6.1]
  def change
    add_reference :stages, :race, null: false, foreign_key: true
  end
end
