require 'rails_helper'

describe "the sort products A to Z scope" do
    it "shows a view of all products sorted A to Z" do
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on "Products"
        click_on "A to Z"
        expect(page).to have_content "Dishwasher"
    end
end