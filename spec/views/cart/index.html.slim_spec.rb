require "spec_helper"

describe "cart/index.html.slim" do
  before(:each) do
    @cart = session[:cart] ||= Cart.new
  end
  context "when the cart is empty" do
    it "should notify user of the fact" do
      render

      expect(rendered).to include 'No items in your cart'
    end
  end

  context "when the cart is not empty" do
    let(:item) { FactoryGirl.build_stubbed(:item) }
    before(:each) do
      @cart.add(item)
    end

    it "should display the items" do
      render

      expect(rendered).to include item.name
    end
  end
end