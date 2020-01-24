require 'rails_helper'

describe "the add a product process" do
    it "adds a new product" do
      admin = User.create(:name => "George Bluth Sr.", :email => 'admin@admin.com', :password => 'admin', :admin =>  true)
      visit '/'
      click_on 'Sign in'
      fill_in :email, with: 'admin@admin.com'
      fill_in :password, with: 'admin'
      click_on 'Log in'

      visit products_path
      click_link 'Create new product'
      fill_in 'Name', :with => '1960 First Press Giant Steps vinyl'
      fill_in 'Cost', :with => '27'
      fill_in 'Country of origin', :with => 'Belgium'
      click_on 'Create Product'
      expect(page).to have_content 'was successfully added!'
      expect(page).to have_content '1960 First Press Giant Steps Vinyl'
    end
  
    it "gives an error when no name is entered" do
      admin = User.create(:name => "George Bluth Sr.", :email => 'admin@admin.com', :password => 'admin', :admin =>  true)
      visit '/'
      click_on 'Sign in'
      fill_in :email, with: 'admin@admin.com'
      fill_in :password, with: 'admin'
      click_on 'Log in'
      visit new_product_path
      click_on 'Create Product'
      expect(page).to have_content "Name can't be blank"
    end
  end