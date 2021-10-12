class CreateSportTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sports do |t|
      t.string :name_ru, null: false
      t.string :name_en, null: false 
      t.string :slug, null: false 
      t.timestamps
      t.index :name_ru
      t.index :name_en
      t.index :slug
    end
  end
end
