class CreateInventoryitems < ActiveRecord::Migration
  def change
    create_table :inventoryitems do |t|
      t.string :name
      t.decimal :cost
      t.integer :count

      t.timestamps
    end
  end
end
