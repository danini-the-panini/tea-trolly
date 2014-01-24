require 'spec_helper'
require 'exceptions'

describe Cart do
  let(:cart) { Cart.new }

  context "when new" do
    it "should be empty" do
      expect(cart.empty?).to eq(true)
    end
  end

  context "when empty" do
    it "should not allow the cart to be emptied" do
      expect{cart.empty!}.to raise_error(Exceptions::EmptyCartError)
    end
  end

  context "when not empty" do
    let(:item) { FactoryGirl.build_stubbed(:item, :price => 20.0) }
    before(:each) do
      cart.add(item)
    end

    it "should allow to be emptied" do
      cart.empty!

      expect(cart.empty?).to eq(true)
    end

    it "should calulate the total price" do
      cart.add(FactoryGirl.build_stubbed(:item, :price => 50.0))
      cart.set_quantity(item, 2)

      expect(cart.price).to eq(90)
    end

    it "should calculate the total number of items" do
      cart.add(FactoryGirl.build_stubbed(:item))
      cart.set_quantity(item, 2)

      expect(cart.quantity).to eq(3)
    end

    context "when a specific item is present" do

      it "should allow the item to be removed" do
        cart.remove(item)

        expect(cart.include?(item)).to eq(false)
      end

      it "should get the quantity of the item" do
        expect(cart.quantity_of(item)).to eq(1)
      end

      context "when added again" do
        it "should increase quantity" do
          cart.add(item)

          expect(cart.quantity_of(item)).to eq(2)
        end
      end

      it "should allow the quantity to be set" do
        cart.set_quantity(item, 5)

        expect(cart.quantity_of(item)).to eq(5)
      end

      context "when that item's quantity is set to zero" do
        it "should remove the item" do
          cart.set_quantity(item, 0)

          expect(cart.include?(item)).to eq(false)
        end
      end
    end

    context "when a specific item is not present" do
      let(:item_b) { FactoryGirl.build_stubbed(:item) }

      it "should allow the item to be added" do
        cart.add(item_b)

        expect(cart.include?(item_b)).to eq(true)
      end

      it "should not allow the item to be removed" do
        expect{cart.remove(item_b)}.to raise_error(Exceptions::ItemNotInCartError)
      end

      it "should not get the quantity of the item" do
        expect{cart.quantity_of(item_b)}.to raise_error(Exceptions::ItemNotInCartError)
      end

      it "should not allow the quantity of the item to be set" do
        expect{cart.set_quantity(item_b,1)}.to raise_error(Exceptions::ItemNotInCartError)
      end
    end
  end
end