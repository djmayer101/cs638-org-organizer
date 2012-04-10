class CreatePositionAssignments < ActiveRecord::Migration
  def change
    create_table :position_assignments do |t|

      t.timestamps
    end
  end
  def down
    drop_table :position_assignments
  end
end
