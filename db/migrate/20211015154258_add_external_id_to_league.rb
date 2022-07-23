class AddExternalIdToLeague < ActiveRecord::Migration[6.1]
  def change
    add_column :leagues, :external_id, :bigint, null: true, uniq: true
  end
end
