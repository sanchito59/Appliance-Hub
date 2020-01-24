require 'rails_helper'

describe 'the sign in for an admin account process' do
    it 'signs in an admin account' do
        admin = FactoryBot.create(:admin)
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'admin@admin.com'
        fill_in :password, with: 'admin'
        click_on 'Log in'
        expect(page).to have_content "Welcome, Admin."
    end
    
    it "gives an error when account parameters aren't entered or entered accurately" do
        admin = FactoryBot.create(:admin)
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'admin@admin.com'
        fill_in :password, with: 'WRONG PASSWORD'
        click_on 'Log in'
        expect(page).to have_content 'There was a problem signing in.'
    end
end