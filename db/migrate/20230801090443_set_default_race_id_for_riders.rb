class SetDefaultRaceIdForRiders < ActiveRecord::Migration[7.0]
  def up
    Rider.where(race_id: nil).update_all(race_id: Race.first.id)
  end
end
