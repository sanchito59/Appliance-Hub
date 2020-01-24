require 'rails_helper'

describe "unauthorized edit of a product process" do
    it "does not permit a user to edit a product" do
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on "Products"
        click_on "Dishwasher"
        click_on "Edit"
        expect(page).to have_content("You do not have permission to do that.")
    end
end