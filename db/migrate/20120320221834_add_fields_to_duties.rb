class AddFieldsToDuties < ActiveRecord::Migration
  def change
    add_column :duties, :deadline, :date

    add_column :duties, :assignee, :integer

    add_column :duties, :assigner, :integer

    add_column :duties, :penalty, :string

    add_column :duties, :confirmation, :boolean

  end
end
