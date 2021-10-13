class CreateBookmaker < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmakers do |t|
      t.string :name_en, null: false, uniq: true, limit: 10
      t.string :name_ru, null: false, uniq: true, limit: 10
      t.string :slug, null: false, uniq: true, limit: 10
      t.string :url
      t.index :slug
      t.timestamps
    end
  end
end
