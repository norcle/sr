class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :external_id, null: true, uniq: true
      t.bigint :parent_id, null: false, default: 1
      t.references :bookmaker, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.integer :level, null: false, default: 1
      t.bigint :team1_id, null: true
      t.bigint :team2_id, null: true
      t.string :slug
      t.index :slug
      t.index :external_id

      t.timestamps
    end
  end
end
