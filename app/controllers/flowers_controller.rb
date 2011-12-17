class FlowersController < InheritedResources::Base
	before_filter :load_cart
	has_scope :f_type

	def load_cart
	  if user_signed_in?
			@cart = current_user.carts.where(:active => true).last
	  else
	  	@cart = nil
  	end
		@categories = Category.all
	end

	def prices
		@flowers = Flower.all
	end

	protected
    def collection
      @flowers ||= end_of_association_chain.page(params[:page])
    end

end
