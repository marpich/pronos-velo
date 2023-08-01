class AddNotNullConstraintToRaceIdInRiders < ActiveRecord::Migration[7.0]
  def up
    change_column_null :riders, :race_id, false
  end

  def down
    change_column_null :riders, :race_id, true
  end
end
