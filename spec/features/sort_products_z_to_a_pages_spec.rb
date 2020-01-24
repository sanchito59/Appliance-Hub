require 'rails_helper'

describe "the sort products Z to A scope" do
    it "shows a view of all products sorted Z to A" do
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on "Products"
        click_on "Z to A"
        expect(page).to have_content "Dishwasher"
    end
end