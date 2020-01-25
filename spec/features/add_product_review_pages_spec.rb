require 'rails_helper'

describe 'the add a product review process' do
    it 'user signs in, navigates to a product, and adds a review.' do
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
    end

    it "gives an error when no author is entered" do
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

        click_on "Create Review"
        expect(page).to have_content "Author can't be blank"
      end
end