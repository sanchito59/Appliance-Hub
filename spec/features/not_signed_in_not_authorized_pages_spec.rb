require 'rails_helper'

describe "the not signed in and try to navigate to certain pages process" do
    it "does not authorize you to view pages" do
        visit '/'
        click_on "Add Product"
        expect(page).to have_content("You aren't authorized to visit that page.")
    end
end