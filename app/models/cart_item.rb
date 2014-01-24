require 'exceptions'

class CartItem
  def initialize(item)
    @item = item
    @quantity = 1
  end

  def item
    @item
  end

  def quantity
    @quantity
  end

  def quantity= value
    raise Exceptions::NegativeQuantityError if value < 0
    @quantity = value
  end

  def price
    @item.price * @quantity
  end
end