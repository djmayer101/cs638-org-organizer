class AddFieldsToDuties < ActiveRecord::Migration
  def change
    add_column :duties, :deadline, :date

    #add_column :duties, :user_id, :integer

    add_column :duties, :assigner, :integer

    add_column :duties, :penalty, :string

    add_column :duties, :confirmation, :boolean

  end
  
  def down
    remove_column :duties, :deadline

    #add_column :duties, :user_id, :integer

    remove_column :duties, :assigner

    remove_column :duties, :penalty

    remove_column :duties, :confirmation
  end
end
