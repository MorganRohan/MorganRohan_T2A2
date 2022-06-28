require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      title: "MyString",
      description: nil,
      condition: "MyText",
      price: 1,
      sold: false,
      account: nil,
      category: nil
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[description]"

      assert_select "textarea[name=?]", "listing[condition]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[sold]"

      assert_select "input[name=?]", "listing[account_id]"

      assert_select "input[name=?]", "listing[category_id]"
    end
  end
end
