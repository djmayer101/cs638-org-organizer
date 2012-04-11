class CreateUsersDutiesJoin < ActiveRecord::Migration
  def up
    create_table :duties_users, :id => false do |t|
      t.integer "user_id"
      t.integer "duty_id"
    end    
    add_index :duties_users, ["user_id", "duty_id"]
  end

  def down
    drop_table :duties_users
  end
end
