require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  describe "the home page" do

    it "has a working navigation pane" do 
      visit '/'
      expect(page).to have_content "Blogville"
      expect(page).to have_link "All Articles"
      expect(page).to_not have_link "New Article"
      expect(page).to_not have_link "Your Articles"

      # Logged in
      sign_up
      expect(page).to have_link "New Article"
      expect(page).to have_link "Your Articles"
      expect(page).to have_link "Log Out"
    end

    it "correctly CRUD's & indexes a new article" do 
      visit '/'
      sign_up
      click_link 'New Article'

      title = "One of many tales from a grand adventurer"
      entry = "Travelling to the center of the earth I saw wild crea..."
      new_title = "On second thought..."

      fill_in "Title", with: title
      fill_in "Create your entry", with: entry
      click_button "Create Article"

      expect(page).to have_content title
      expect(page).to have_content entry
      expect(page).to have_link "Edit"
      expect(page).to have_link "Delete"

      click_link "All Articles"
      expect(page).to have_content title

      click_link title
      click_link "Edit"
      fill_in "Title", with: new_title
      click_button "Update Article"
      expect(page).to have_content new_title
      expect(page).to have_content entry

      click_link "Delete"

    end

    # it "correctly allows users to edit or delete their own articles"
  end
end
