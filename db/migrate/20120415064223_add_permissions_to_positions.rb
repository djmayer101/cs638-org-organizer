class AddPermissionsToPositions < ActiveRecord::Migration
  def change
    add_column  :positions, :addEvents, :boolean, :default => false
    
    add_column  :positions, :addDuties, :boolean, :default => false
    
    add_column  :positions, :addItems,  :boolean, :defualt => false
    
  end
end
