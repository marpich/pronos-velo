class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stage, null: false, foreign_key: true
      t.references :rider, null: false, foreign_key: true
      t.integer :score
      t.integer :position

      t.timestamps
    end
  end
end
