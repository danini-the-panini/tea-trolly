require 'exceptions'

class Cart
  def initialize
    @items = Hash.new
  end

  def empty?
    @items.empty?
  end

  def empty!
    raise Exceptions::EmptyCartError if self.empty?

    @items = Hash.new
  end

  def include?(item)
    @items.include?(item.id)
  end

  def add(item)
    if include?(item)
      self.set_quantity(item,self.quantity_of(item)+1)
    else
      @items[item.id] = CartItem.new(item)
    end
  end

  def remove(item)
    raise Exceptions::EmptyCartException if self.empty?
    raise Exceptions::ItemNotInCartError unless self.include?(item)

    @items.delete(item.id)
  end

  def quantity_of(item)
    raise Exceptions::ItemNotInCartError unless self.include?(item)

    @items[item.id].quantity
  end

  def set_quantity(item, quantity)
    raise Exceptions::ItemNotInCartError unless self.include?(item)

    if quantity == 0
      self.remove(item)
    else
      @items[item.id].quantity = quantity
    end
  end

  def price
    total = 0
    @items.each_value { |cart_item| total += cart_item.price }
    total
  end
end