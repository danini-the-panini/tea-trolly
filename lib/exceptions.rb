module Exceptions
  class CartError < StandardError; end
  class EmptyCartError < CartError; end
  class ItemNotInCartError < CartError; end
  class NegativeQuantityError < CartError; end
end