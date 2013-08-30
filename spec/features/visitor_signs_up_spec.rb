require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password', :js => true do
    sign_up_with 'username', 'valid@example.com', 'password', 'password'

    expect(page).to have_content('Log Out')
  end

  scenario 'with invalid email', :js => true do
    sign_up_with 'username', 'invalid_email', 'password', 'password'

    expect(page).to have_content('Sign up!')
  end

  scenario 'with blank password', :js => true do
    sign_up_with 'username', 'invalid_email', 'valid@example.com', ''

    expect(page).to have_content('Sign up!')
  end 

  def sign_up_with(username, email, password, password_confirmation)
    visit new_user_path
    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Create User'
  end
end
