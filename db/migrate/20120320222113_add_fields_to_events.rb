class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_date, :datetime

    add_column :events, :end_date, :datetime

    add_column :events, :formality_lvl, :string

    add_column :events, :owner, :integer

    add_column :events, :location, :string

  end
  
  def down
    remove_column :events, :start_date

    remove_column :events, :end_date

    remove_column :events, :formality_lvl

    remove_column :events, :owner

    remove_column :events, :location

  end
  
end
