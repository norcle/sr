class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.references :bookmaker, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true
      t.string :external_id, null: true, uniq: true
      t.string :name_ru, null: false, uniq: true, limit: 20
      t.string :name_en, null: false, uniq: true, limit: 20
      t.string :slug, null: false, uniq: true, limit: 20
      t.integer :sex, limit: 1
      t.index :name_en
      t.index :name_ru
      t.index :slug
      t.index :external_id

      t.timestamps
    end
  end
end
