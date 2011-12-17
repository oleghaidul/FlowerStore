class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	belongs_to :gift
	PAYMENT_TYPES = ["Check", "Credit Cart", "Purchase order"]

	

end
