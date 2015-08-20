require "test_helper"

feature "User::SignUp" do
  scenario "Happy Path: User Successful Sign up" do
    visit new_user_registration_path
    fill_in 'Email', with: 'me@you.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    page.must_have_content "Welcome! You have signed up successfully."
    page.wont_have_content "Goobye All!"
  end

  scenario 'Unhappy Path, Empty Fields' do
    visit new_user_registration_path
    click_button 'Sign up'
    page.must_have_content 'Email can\'t be blank'
    page.must_have_content 'Password can\'t be blank'
  end
end
