class AddStatusToDuties < ActiveRecord::Migration
  def change
    add_column :duties, :status, :integer
  end
  def down
    remove_column :duties, :status
  end
end
