module ApplicationHelper

  ## Feature specs

  def sign_up(email: "example@example.com", password: "foobarfoobar")
    click_link 'Register'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

  def log_in
    click_link "Log in"
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    check 'Remember me'
    click_button "Log in"
  end

  def log_out
    click_link "Log Out"
  end

  def create_new_article(title: "One of many tales from a grand adventurer", 
                        entry: "Travelling to the center of the earth I saw wild crea...")
    click_link 'New Article'
    fill_in "Title", with: title
    fill_in "Create your entry", with: entry
    click_button "Create Article"
  end

  def create_new_comment(name: "George Bluth", body: "There's always money in the banana stand.")
    fill_in "Name", with: name
    fill_in "Response", with: body
    click_button "Create Comment"
  end
end