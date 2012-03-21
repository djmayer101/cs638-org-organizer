class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties do |t|
      t.string  :title
      t.text    :description
      t.timestamps
    end
  end
end
