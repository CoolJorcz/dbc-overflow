module AuthenticationHelper
  def sign_in
    visit root_path

    user = FactoryGirl.create(:user)

    fill_in 'user_session_email',    with: user.email
    fill_in 'user_session_password', with: user.password
    click_button "Sign in"

    return user
  end
end