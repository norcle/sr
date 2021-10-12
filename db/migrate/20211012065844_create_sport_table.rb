class CreateSportTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sports do |t|
      t.string :name_ru, null: false, uniq: true, limit: 20
      t.string :name_en, null: false, uniq: true, limit: 15
      t.string :slug, null: false, uniq: true, limit: 15
      t.timestamps
      t.index :name_ru
      t.index :name_en
      t.index :slug
    end
  end
end