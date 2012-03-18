class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string  :formality_lvl
      t.integer :owner #User_id
      t.string  :location
      t.timestamps
    end
  end
end
