class CategoriesController < InheritedResources::Base
	before_filter :authenticate_user!
	before_filter :load_cart

	def load_cart
		@cart = current_user.carts.last
		@categories = Category.all
	end
end
