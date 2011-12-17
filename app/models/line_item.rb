class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :cart
	belongs_to :flower

	def full_price
	  flower.price*quantity
	end

end
