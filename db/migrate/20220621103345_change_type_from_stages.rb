class ChangeTypeFromStages < ActiveRecord::Migration[6.1]
  def change
    rename_column :stages, :type, :stage_type
  end
end
