require 'rails_helper'

describe 'the sign in for an admin account process' do
    it 'signs in an admin account' do
        admin = User.create(:name => "George Bluth Sr.", :email => 'admin@admin.com', :password => 'admin', :admin =>  true)
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'admin@admin.com'
        fill_in :password, with: 'admin'
        click_on 'Log in'
        expect(page).to have_content "Welcome, Admin."
    end
    
    it "gives an error when account parameters aren't entered or entered accurately" do
        admin = User.create(:name => "George Bluth Sr.", :email => 'admin@admin.com', :password => 'admin', :admin =>  true)
        visit '/'
        click_on 'Sign in'
        fill_in :email, with: 'admin@admin.com'
        fill_in :password, with: 'WRONG PASSWORD'
        click_on 'Log in'
        expect(page).to have_content 'There was a problem signing in.'
    end
end