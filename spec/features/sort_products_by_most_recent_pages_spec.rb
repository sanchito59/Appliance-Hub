require 'rails_helper'

describe "the sort by most recent products scope" do
    it "shows a view of the three most recent products" do
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on "Products"
        click_on "Sort"
        click_on "Most Recent"
        expect(page).to have_content "Dishwasher"
    end
end