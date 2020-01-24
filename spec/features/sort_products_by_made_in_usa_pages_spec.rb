require 'rails_helper'

describe "the sort by Made In USA scope" do
    it "shows a sorted view of products made in the USA" do
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on "Products"
        click_on "Sort"
        click_on "Made In USA"
        expect(page).to have_content "There are no products yet."
    end
end