class AddStillRacingToRiders < ActiveRecord::Migration[7.0]
  def change
    add_column :riders, :still_racing, :boolean, default: true
  end
end
