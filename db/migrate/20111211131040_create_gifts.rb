class CreateGifts < ActiveRecord::Migration
  def self.up
    create_table :gifts do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :gifts
  end
end
