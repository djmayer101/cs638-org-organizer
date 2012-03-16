class CreateDutyAssignments < ActiveRecord::Migration
  def change
    create_table :duty_assignments do |t|

      t.timestamps
    end
  end
end
