class RemoveScoreFromBets < ActiveRecord::Migration[6.1]
  def change
    remove_column :bets, :score, :integer
  end
end
