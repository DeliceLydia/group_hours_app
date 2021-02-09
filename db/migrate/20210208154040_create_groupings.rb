class CreateGroupings < ActiveRecord::Migration[6.1]
  def change
    create_table :groupings do |t|
      t.string :name
      t.integer :hours

      t.timestamps
    end
  end
end
