class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_cart

	def load_cart
	  if user_signed_in?
			@cart = current_user.carts.where(:active => true).last
	  else
	  	@cart = nil
  	end
		@categories = Category.all
	end

  def new
  	if @cart.line_items.empty?
  		redirect_to root_url, :notice => "Your cart is empty!"
  		return
  	end

  	@order = Order.new

  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      @cart.update_attributes(:active => false)
      redirect_to root_url, :notice => 'Thank you for your order.'
    else
      render :action => "new"
    end
  end

end
