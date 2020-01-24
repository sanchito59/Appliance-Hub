require 'rails_helper'

describe 'the sign up for an admin account process' do
    it 'signs up an admin account' do
        visit '/'
        click_on 'Sign up'
        fill_in 'user[name]', with: 'admin'
        fill_in 'user[email]', with: 'admin@admin.com'
        fill_in 'user[password]', with: 'admin'
        fill_in 'user[password_confirmation]', with: 'admin'
        page.check('user[admin]')
        click_on 'Sign Up'
        expect(page).to have_content 'Welcome, Admin.'
    end

    it "flashes an error when account parameters aren't entered or entered accurately" do
        visit '/'
        click_on 'Sign up'
        fill_in 'user[name]', with: 'admin'
        fill_in 'user[email]', with: 'admin@admin.com'
        fill_in 'user[password]', with: 'admin'
        fill_in 'user[password_confirmation]', with: 'WRONG PASSWORD'
        page.check('user[admin]')
        click_on 'Sign Up'
        expect(page).to have_content "There was a problem signing up."
      end
end