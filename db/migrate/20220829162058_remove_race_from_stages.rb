class RemoveRaceFromStages < ActiveRecord::Migration[6.1]
  def change
    remove_reference :stages, :race, foreign_key: true
  end
end
