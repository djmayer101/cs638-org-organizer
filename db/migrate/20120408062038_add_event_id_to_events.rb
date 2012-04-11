class AddEventIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_id, :string

  end
  def down
    remove_column :events, :event_id
  end
end
