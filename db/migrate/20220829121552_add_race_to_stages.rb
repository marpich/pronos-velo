class AddRaceToStages < ActiveRecord::Migration[6.1]
  def change
    add_reference :stages, :race, foreign_key: true
  end
end
