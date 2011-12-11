class LineItemsController < ApplicationController
  before_filter :load_cart

  def load_cart
    if user_signed_in?
      @cart = current_user.carts.last
    else
      @cart = nil
    end
    @categories = Category.all
  end

	def create
		@cart = current_cart
    flower = Flower.find(params[:flower_id])
    if @cart.nil?
      @cart = Cart.create(:name => "MyCart", :user_id => current_user.id)
      if @cart.add_flower(flower.id, @cart.id).save
      end
    else
      if @cart.add_flower(flower.id, @cart.id).save
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    @cart = current_cart
    @carts = current_user.carts
  end

  private 
  	
  	def current_cart
		  current_user.carts.last
		end

end
