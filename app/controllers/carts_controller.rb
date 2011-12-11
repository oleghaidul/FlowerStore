class CartsController < InheritedResources::Base
	before_filter :authenticate_user!
	before_filter :load_cart

	def load_cart
	  if user_signed_in?
			@cart = current_user.carts.last
	  else
	  	@cart = nil
  	end
		@categories = Category.all
	end
end
