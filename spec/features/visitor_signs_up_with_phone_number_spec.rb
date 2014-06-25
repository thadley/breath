require 'spec_helper'

feature 'Visitor signs up with phone number' do

  scenario 'on profile page' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_phone_number', with: '1234567890'
    select('Verizon', :from => 'user_carrier')
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  scenario 'on home page' do
    visit root_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_phone_number', with: '1234567890'
    select('Verizon', :from => 'user_carrier')
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
  end

  scenario 'with blank phone number & send sms checked' do
    visit root_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    check 'user[send_sms]'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank if you wish to receive notifications via sms.")
  end

  scenario 'with blank carrier' do
    visit root_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_phone_number', with: '1234567890'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank if you wish to receive notifications via sms.")
  end

  scenario 'with 9-digit phone number' do
    visit root_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_phone_number', with: '123456789'
    click_button 'Sign up'
    expect(page).to have_content("must be 10 digits.")
  end

  scenario 'with a non-numeric phone number' do
    visit root_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_phone_number', with: '123456789x'
    click_button 'Sign up'
    expect(page).to have_content("may only consist of numbers.")
  end

  scenario 'with a duplicate phone number' do
    visit root_path
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_phone_number', with: '1234567890'
    select('Verizon', :from => 'user_carrier')
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    fill_in 'user_phone_number', with: '1234567890'
    select('Verizon', :from => 'user_carrier')
    click_button 'Sign up'
    expect(page).to have_content('is already associated with an account.')
  end

end

# Feature: Visitor signs up with phone number

# Scenario: on profile page

#   Visitor goes to the new user registration page
#   Enters email, password, confirmation, phone number, and carrier
#   Submits information
#   Sees confirmation email message

# Scenario: on home page

#   Visitor goes to the home page
#   Enters email, password, confirmation, phone number, and carrier
#   Submits information
#   Sees confirmation email message

# Scenario: with blank phone number & send sms checked

#   Visitor goes to the home page
#   Enters email, password, and confirmation
#   Checks 'send sms'
#   Submits information
#   Sees error message

# Scenario: with blank carrier

#   Visitor goes to the home page
#   Enters email, password, confirmation, and phone number
#   Submits information
#   Sees error message

# Scenario: with 9-digit phone number

#   Visitor goes to the home page
#   Enters email, password, and confirmation
#   Enters 9-digit phone number
#   Submits information
#   Sees error message

# Scenario: with non-numeric phone number

#   Visitor goes to the home page
#   Enters email, password, and confirmation
#   Enters non-numeric phone number
#   Submits information
#   Sees error message

# Scenario: with duplicate phone number

#   Visitor goes to the home page
#   Enters email, password, confirmation, phone number, and carrier
#   Submits information
#   Sees confirmation email message
#   Enters email, password, confirmation, (same) phone number, and carrier
#   Submits information
#   Sees error message
