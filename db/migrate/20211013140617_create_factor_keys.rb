class CreateFactorKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :factor_keys do |t|
      t.string :name_en, null: false, uniq: false, limit: 20
      t.string :name_ru, null: false, uniq: false, limit: 20
      t.bigint :external_id, null: false, uniq: true
      t.timestamps
      t.index :name_en
      t.index :name_ru
      t.index :external_id
    end
  end
end
