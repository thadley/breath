require 'spec_helper'

feature 'Visitor signs up with email' do

  scenario 'on profile page' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  scenario 'on home page' do
    visit root_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  scenario 'with blank email' do
    visit new_user_registration_path
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'with blank password' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content("Password can't be blank")
  end

end


# Feature: Visitor signs with email

# Scenario: on profile page

#   Visitor goes to the new user registration page
#   Submits email, password, and confirmation
#   Submits information
#   Sees confirmation email message

# Scenario: on home page

#   Visitor goes to the home page
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