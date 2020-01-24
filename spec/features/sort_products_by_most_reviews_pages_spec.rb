require 'rails_helper'

describe "the most reviwed product sorting scope" do
    it "shows the highest reviewed product" do
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on "Products"
        
        click_on "Dishwasher"
        click_on "Add a review"
        
        fill_in 'review[author]', with: "Michael Bluth"
        fill_in 'review[content_body]', with: "Stygian hideous decadent mortal. Stygian dank noisome lurk. Tenebrous amorphous dank lurk eldritch singular noisome. Eldritc."
        find_field('review[rating]').set(5)
        click_on "Create Review"
        
        click_on "Products"
        click_on "Sort"
        click_on "Most Reviewed Product"
        expect(page).to have_content "Dishwasher"
    end
end