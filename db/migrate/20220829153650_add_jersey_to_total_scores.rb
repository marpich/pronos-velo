class AddJerseyToTotalScores < ActiveRecord::Migration[6.1]
  def change
    add_column :total_scores, :yellow_jersey, :integer, default: 0
    add_column :total_scores, :green_jersey, :integer, default: 0
    add_column :total_scores, :polka_dot_jersey, :integer, default: 0
  end
end
