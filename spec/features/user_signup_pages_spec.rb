require 'rails_helper'

describe 'the sign up for an account process' do
    it 'signs up an account' do
        visit '/'
        click_on 'Sign up'
        fill_in 'user[name]', with: 'user'
        fill_in 'user[email]', with: 'user@user.com'
        fill_in 'user[password]', with: 'user'
        fill_in 'user[password_confirmation]', with: 'user'
        click_on 'Sign Up'
        expect(page).to have_content 'successfully signed up!'
    end

    it "gives an error when account parameters aren't entered or entered accurately" do
        visit '/'
        click_on 'Sign up'
        fill_in 'user[name]', with: 'user'
        fill_in 'user[email]', with: 'user@user.com'
        fill_in 'user[password]', with: 'user'
        fill_in 'user[password_confirmation]', with: 'WRONG PASSWORD'
        click_on 'Sign Up'
        expect(page).to have_content 'There was a problem signing up.'
    end
end