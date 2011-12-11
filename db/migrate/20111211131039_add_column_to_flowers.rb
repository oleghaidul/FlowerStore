class AddColumnToFlowers < ActiveRecord::Migration
  def self.up
    add_column :flowers, :discount, :integer
    add_column :flowers, :rate, :integer
    add_column :flowers, :photo, :string
    add_column :flowers, :f_type, :string
  end

  def self.down
    remove_column :flowers, :rate
    remove_column :flowers, :discount
    remove_column :flowers, :photo
    remove_column :flowers, :f_type
  end
end
