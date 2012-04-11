class CreatePositionsUsersJoin < ActiveRecord::Migration
  def up
    create_table 'positions_users', :id => false do |t|
      t.column :positions_id , :integer
      t.column :users_id, :integer
    end
  end

  def down
  end
end
