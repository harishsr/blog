require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  describe "the home page" do
    before do 
      visit '/' 
      @title = "One of many tales from a grand adventurer"
      @entry = "Travelling to the center of the earth I saw wild crea..."
      @new_title = "On second thought..."
    end

    it "has a working navigation pane" do 
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
      sign_up
      create_new_article

      expect(page).to have_content @title
      expect(page).to have_content @entry
      expect(page).to have_link "Edit"
      expect(page).to have_link "Delete"

      click_link "All Articles"
      expect(page).to have_content @title

      click_link @title
      click_link "Edit"
      fill_in "Title", with: @new_title
      click_button "Update Article"
      expect(page).to have_content @new_title
      expect(page).to have_content @entry

      click_link "Delete"
      expect(page).to_not have_content @new_title
      expect(page).to_not have_content @title
      expect(page).to have_content "Blogville"

    end

    it "does not allow the wrong user to edit or delete articles" do 
      sign_up
      create_new_article
      log_out

      sign_up(email: "second@email.com")
      expect(page).to have_content @title
      click_link @title
      expect(page).to have_content "Back to blog"
      expect(page).to_not have_link "Edit"
      expect(page).to_not have_link "Delete"

      create_new_article(title: @new_title)

      click_link "Your Articles"
      expect(page).to_not have_content @title
      expect(page).to have_content @new_title

    end
  end
end
