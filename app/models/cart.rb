class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	belongs_to :user

	def add_flower(flower_id, cart_id)
		current_item = line_items.where(:flower_id => flower_id).first
			if current_item
			  current_item.quantity += 1
			else
			  current_item = line_items.build(:flower_id => flower_id, :cart_id => cart_id)
			end
		current_item
	end

	def total_price
		line_items.includes(:flower).to_a.sum(&:full_price)
	end

end
