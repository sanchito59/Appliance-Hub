require 'rails_helper'

describe 'the sign in for an account process' do
    it 'signs in an account' do
        visit '/'
        user = FactoryBot.create(:user)
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'user'
        click_on 'Log in'
        expect(page).to have_content "You've signed in."
    end

    it "gives an error when account parameters aren't entered or entered accurately" do
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'user@user.com'
        fill_in :password, with: 'WRONG PASSWORD'
        click_on 'Log in'
        expect(page).to have_content 'There was a problem signing in.'
    end
end