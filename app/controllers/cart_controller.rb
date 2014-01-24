class CartController < ApplicationController
  def index
    @cart = session[:cart] ||= Cart.new
  end
end
