class CreateTotalScores < ActiveRecord::Migration[6.1]
  def change
    create_table :total_scores do |t|
      t.integer :yellow_jersey
      t.integer :green_jersey
      t.integer :polka_dot_jersey
      t.references :race, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
