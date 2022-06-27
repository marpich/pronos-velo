class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.integer :result_position
      t.references :rider, null: false, foreign_key: true
      t.references :stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
