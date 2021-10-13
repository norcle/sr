class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|
      t.string :name_en, null: false, uniq: true, limit: 15
      t.string :name_ru, null: false, uniq: true, limit: 15
      t.integer :sex, limit: 1
      t.string :slug, null: false, uniq: true, limit: 15
      t.references :sport, null: false, foreign_key: true
      t.references :bookmaker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
