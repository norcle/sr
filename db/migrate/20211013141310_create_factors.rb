class CreateFactors < ActiveRecord::Migration[6.1]
  def change
    create_table :factors do |t|
      t.references :event, null: false, foreign_key: true
      t.references :factor_key, null: false, foreign_key: true
      t.integer :parameter, null: true
      t.decimal :value, null: false, precision: 7, scale: 2
      t.timestamps
    end
  end
end
