class HomeController < ApplicationController
  before_filter :load_cart

  def load_cart
    if user_signed_in?
      @cart = current_user.carts.where(:active => true).last
    else
      @cart = nil
    end
    @categories = Category.all
  end

  def index
    @flowers = Flower.scoped
  end

  def about
  end

  def contact
  end

  

end
