class RemoveLogoFromLeagues < ActiveRecord::Migration[6.1]
  def change
    remove_column :leagues, :logo, :string
  end
end
