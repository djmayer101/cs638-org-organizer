class CreatePositionAssignments < ActiveRecord::Migration
  def change
    create_table :position_assignments do |t|

      t.timestamps
    end
  end
end
