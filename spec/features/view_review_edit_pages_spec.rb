require 'rails_helper'

describe "the view the edit product form page process" do
    it "shows the form to edit a product" do
        visit '/'
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        expect(page).to have_content "Dishwasher"
        click_on "Dishwasher"
        click_on "Add a review"
    
        fill_in 'review[author]', with: "Michael Bluth"
        fill_in 'review[content_body]', with: "Stygian hideous decadent mortal. Stygian dank noisome lurk. Tenebrous amorphous dank lurk eldritch singular noisome. Eldritc."
        find_field('review[rating]').set(5)
        click_on "Create Review"
        expect(page).to have_content "Michael Bluth"
        
        click_on "Sign out"
        
        admin = User.create(:name => "George Bluth Sr.", :email => 'admin@admin.com', :password => 'admin', :admin =>  true)
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'admin@admin.com'
        fill_in :password, with: 'admin'
        click_on 'Log in'
        
        visit products_path
        product = FactoryBot.create(:product)
        click_on "Dishwasher"
        click_on "Michael Bluth"
        click_on "Edit review"
        expect(page).to have_content "Edit Michael Bluth's review:"
    end
end