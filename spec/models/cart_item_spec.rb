require 'spec_helper'

describe CartItem do
  before(:each) do
    @cart_item = CartItem.new(FactoryGirl.build_stubbed(:item, :price => 20.0))
  end

  it "should start with a quantity of one" do
    expect(@cart_item.quantity).to eq(1)
  end

  it "should allow quantity to be set" do
    @cart_item.quantity = 5

    expect(@cart_item.quantity).to eq(5)
  end

  it "should calculate the price of the item" do
    @cart_item.quantity = 5

    expect(@cart_item.price).to eq(100)
  end

  it "should not allow quantity to be negative" do
    expect{@cart_item.quantity = -1}.to raise_error(Exceptions::NegativeQuantityError)
  end
end