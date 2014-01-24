class CartController < ApplicationController
  def index
    init_cart
  end

  def add
    init_cart

    @cart.add(Item.find(params[:id]))

    redirect_to cart_index_url
  end

  def empty
    init_cart

    @cart.empty!

    redirect_to cart_index_url
  end

  private
  def init_cart
    @cart = session[:cart] ||= Cart.new
  end

end
