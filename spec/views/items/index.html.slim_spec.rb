require "spec_helper"

describe "items/index.html.slim" do
  it "displays all the items" do
    assign(:items, [
      FactoryGirl.build_stubbed(:item, name: 'Foo'),
      FactoryGirl.build_stubbed(:item, name: 'Bar')
    ])

    render

    expect(rendered).to include 'Foo'
    expect(rendered).to include 'Bar'
  end

  context "when a user is logged in" do
    it "displays an 'Add to Cart' link" do
      assign(:items, [FactoryGirl.build_stubbed(:item)])
      view.stub(:user_signed_in?) { true }
      view.stub(:current_user) { FactoryGirl.build(:user) } 

      render

      expect(rendered).to include 'Add to Cart'
    end
  end

  context "when a user is logged in" do
    it "displays an 'Add to Cart' link" do
      assign(:items, [FactoryGirl.build_stubbed(:item)])
      view.stub(:user_signed_in?) { false }
      view.stub(:current_user) { nil } 

      render

      expect(rendered).to_not include 'Add to Cart'
    end
  end
end