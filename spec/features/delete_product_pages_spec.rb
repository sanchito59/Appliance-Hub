require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
      admin = User.create(:name => "George Bluth Sr.", :email => 'admin@admin.com', :password => 'admin', :admin =>  true)
      visit '/'
      click_on 'Sign in'
      fill_in :email, with: 'admin@admin.com'
      fill_in :password, with: 'admin'
      click_on 'Log in'
      product = FactoryBot.create(:product)
      visit product_path(product.id)
      click_link 'Delete product'
      expect(page).to have_content 'Product was successfully deleted!'
    end
end