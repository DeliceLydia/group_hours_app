class AddForeignKeyToGroupings < ActiveRecord::Migration[6.1]
  def change
    add_reference :groupings, :author, null: false, foreign_key: { to_table: :users }
  end
end
