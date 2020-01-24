require 'rails_helper'

describe 'the view a product review process' do
    it 'shows a product review' do
        visit '/'
        product = FactoryBot.create(:product)
        user = FactoryBot.create(:user)
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on "Dishwasher"
        click_on "Add a review"

        fill_in 'review[author]', with: "Michael Bluth"
        fill_in 'review[content_body]', with: "Stygian hideous decadent mortal. Stygian dank noisome lurk. Tenebrous amorphous dank lurk eldritch singular noisome. Eldritc."
        find_field('review[rating]').set(5)
        click_on "Create Review"
        click_on "Michael Bluth"
        expect(page).to have_content "Stygian hideous decadent mortal. Stygian dank noisome lurk. Tenebrous amorphous dank lurk eldritch singular noisome. Eldritc."
    end
end