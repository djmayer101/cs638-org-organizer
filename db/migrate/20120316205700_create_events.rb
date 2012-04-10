class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
