class CreateProjectRecorders < ActiveRecord::Migration[6.1]
  def change
    create_table :project_recorders do |t|
      t.string :name
      t.string :hours
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
