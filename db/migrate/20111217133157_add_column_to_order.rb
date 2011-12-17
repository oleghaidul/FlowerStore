class AddColumnToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :gift_id, :integer
  end

  def self.down
    remove_column :orders, :gift_id
  end
end
