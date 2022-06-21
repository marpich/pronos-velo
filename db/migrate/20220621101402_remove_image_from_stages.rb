class RemoveImageFromStages < ActiveRecord::Migration[6.1]
  def change
    remove_column :stages, :image_map
  end
end
