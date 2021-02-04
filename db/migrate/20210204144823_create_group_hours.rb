class CreateGroupHours < ActiveRecord::Migration[6.1]
  def change
    create_table :group_hours do |t|
      t.references :group, null: false, foreign_key: true
      t.references :project_recorder, null: false, foreign_key: true
      t.timestamps
    end
  end
end
