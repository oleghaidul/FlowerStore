class CreateFlowers < ActiveRecord::Migration
  def self.up
    create_table :flowers do |t|
      t.string :name
      t.integer :category_id
      t.text :description
      t.integer :price
      t.integer :country_id
      t.integer :storage_id

      t.timestamps
    end
  end

  def self.down
    drop_table :flowers
  end
end
