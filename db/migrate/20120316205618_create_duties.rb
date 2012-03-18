class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties do |t|
      t.string  :title
      t.string  :description
      t.date    :deadline
      t.integer :assignee #use the user's id
      t.integer :assigner
      t.string  :penalty
      t.boolean :confirmation
    end
  end
end
