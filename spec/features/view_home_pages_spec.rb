require 'rails_helper'

describe "the visit the homepage process" do
    it "visits the homepage" do
      visit ('/')
      expect(page).to have_content 'Our most reviewed product!'
      expect(page).to have_content 'Our three newest products!'
      expect(page).to have_content 'Locally Produced'
    end
  end