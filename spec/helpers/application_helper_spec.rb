module ApplicationHelper

  def sign_up
    email = "example@example.com"
    password = "foobarfoobar"
    click_link 'Register'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

  # def sign_in
    
  #   click_link "Log in"
  #   fill_in 'Email', with: email
  #   fill_in 'Password', with: password
  #   check 'Remember me'
  #   click_button "Log in"
  # end
end