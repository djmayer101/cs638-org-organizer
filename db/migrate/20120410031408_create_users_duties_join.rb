class CreateUsersDutiesJoin < ActiveRecord::Migration
  def up
    create_table :users_duties, :id => false do |t|
      t.integer "user_id"
      t.integer "duty_id"
    end    
    add_index :users_duties, ["user_id", "duty_id"]
  end

  def down
    drop_table :users_duties
  end
end
