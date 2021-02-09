class DropGroupedHoursTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :grouped_hours, force: :cascade
  end
end
