class RemoveJerseyFromTotalScores < ActiveRecord::Migration[6.1]
  def change
    remove_column :total_scores, :yellow_jersey, :integer
    remove_column :total_scores, :green_jersey, :integer
    remove_column :total_scores, :polka_dot_jersey, :integer
  end
end
