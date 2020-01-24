require 'rails_helper'

describe 'the sign out process' do
    it 'signs a user out' do
        visit '/'
        user = FactoryBot.create(:user)
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        click_on 'Sign out'
        expect(page).to have_content "You've signed out."
    end
end