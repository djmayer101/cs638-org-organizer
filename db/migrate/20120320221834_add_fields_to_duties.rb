class AddFieldsToDuties < ActiveRecord::Migration
  def change
    add_column :duties, :deadline, :date

    add_column :duties, :user_id, :integer

    add_column :duties, :penalty, :string

    add_column :duties, :confirmation, :boolean
    
    add_index :duties, :user_id

  end
  
  def down
    remove_index :duties, :user_id
    
    remove_column :duties, :confirmation

    remove_column :duties, :penalty

    remove_column :duties, :user_id

    remove_column :duties, :deadline
    
  end
end
