require 'rails_helper'

describe 'the sign up for an admin account process' do
    it 'signs up an admin account' do
        visit '/'
        click_on 'Sign up'
        fill_in 'user[name]', with: 'user'
        fill_in 'user[email]', with: 'user@user.com'
        fill_in 'user[password]', with: 'user'
        fill_in 'user[password_confirmation]', with: 'user'
        page.check('user[admin]')
        click_on 'Sign Up'
        expect(page).to have_content 'Welcome, Admin.'
    end
end