class AddAssignedUserIdToDuties < ActiveRecord::Migration
  def change
    add_column :duties, :assigner_id, :integer #id of the officer that assigned the duty
  end
    def down
    remove_column :duties, :assigner_id
    end
end
