require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before do 
    visit '/'
    @name = "George Bluth"
    @body = "There's always money in the banana stand."
    @new_name = "Banana Grabber"
    @new_title = "On second thought..."
  end

  it "should create a comment successfully" do 
    sign_up
    create_new_article
    create_new_comment

    expect(page).to have_content @name
    expect(page).to have_content @body
  end

  it "should show the comment on the correct page" do
    sign_up
    create_new_article
    create_new_comment

    create_new_article(title: @new_title)
    expect(page).to have_content @new_title
    create_new_comment(name: @new_name)
    expect(page).to have_content @new_name
    expect(page).to_not have_content @name
  end
end
