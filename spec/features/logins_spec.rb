require 'rails_helper'

RSpec.feature "Logins", type: :feature do

  it "valid registration & login" do 
    email = "examples@example.com"
    password = "foobarfoobar"

    visit '/'
    click_link 'Register'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."

    click_link 'Log Out'
    expect(page).to have_content "Goodbye!  You've signed out successfully."
    expect(page).to_not have_content "Your Articles"

    click_link "Log in"
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    check 'Remember me'
    click_button "Log in"
    expect(page).to have_content "Welcome back!  You've signed in successfully."
  end

  it "invalid registration" do 
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'invalid@'
    fill_in 'Password', with: ''
    fill_in "Password confirmation", with: ""
    click_button 'Sign up'
    expect(page).to have_content "2 errors prohibited this user from being saved"
  end
end
