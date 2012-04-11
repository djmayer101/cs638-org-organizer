class CreatePositionsUsersJoin < ActiveRecord::Migration
  def up
    create_table 'positions_users', :id => false do |t|
      t.column :position_id , :integer
      t.column :user_id, :integer
    end
  end

  def down
    drop_table :positions_users
  end
end
