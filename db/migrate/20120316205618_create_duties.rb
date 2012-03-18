class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties do |t|
      t.string  :title
      t.text    :description
      t.date    :deadline
      t.integer :assignee #use the user's id
      t.integer :assigner
      t.string  :penalty
      t.boolean :confirmation
      t.timestamps
    end
  end
end
