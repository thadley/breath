require 'spec_helper'

feature 'Visitor signs up' do
  before :each do
    visit new_user_registration_path
  end

  scenario 'Successfully' do
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  scenario 'with blank email' do
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'with blank password' do
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content("Password can't be blank")
  end

end


# Feature: Visitor signs up

# Scenario: Successfully

#   Visitor goes to the new user registration page
#   Submits email, password, and confirmation
#   Submits information
#   Sees confirmation email message

# Scenario: with blank email

#   Visitor goes to the new user registration page
#   Submits password and confirmation
#   Submits information
#   Sees error message

# Scenario: with blank password

#   Visitor goes to the new user registration page
#   Submits email
#   Submits information
#   Sees error message