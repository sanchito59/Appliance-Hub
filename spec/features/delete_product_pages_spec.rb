require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    product = Product.create(name: "40 Speed Dishwasher", cost: 78000, country_of_origin: "United States of America")
      visit product_path(product.id)
      click_link 'Delete product'
      expect(page).to have_content 'Product was successfully deleted!'
    end
end