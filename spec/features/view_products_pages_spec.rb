require 'rails_helper'

describe "the view all products page" do
    it "shows a list of all products" do
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on "Products"
        expect(page).to have_content "Dishwasher"
    end
end