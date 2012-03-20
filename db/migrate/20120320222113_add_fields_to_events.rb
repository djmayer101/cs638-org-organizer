class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_date, :datetime

    add_column :events, :end_date, :datetime

    add_column :events, :formality_lvl, :string

    add_column :events, :owner, :integer

    add_column :events, :location, :string

  end
end
