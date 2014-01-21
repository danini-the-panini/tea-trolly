class ItemsController < ApplicationController
  def list
    @items = Item.all
  end
end
