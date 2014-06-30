require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
user.save

feature 'verifies phone number' do

  before :each do
    logout(:user)
  end

  scenario 'Successfully' do
    visit new_user_session_path
    login_as(user, :scope => :user)
    visit edit_profile_path
    fill_in 'user_phone_number', with: '1234567890'
    select('USCellular', :from => 'user_carrier')
    click_button 'Save'
    expect(page).to have_content('A verification code was sent to your phone')
    visit users_verify_sms_path
    user.reload
    fill_in 'user_sms_verification_code_conf', with: user.sms_verification_code
    click_button 'Save'
    expect(page).to have_content('Verification successful')
  end
end


# Feature: User verifies phone number

# Scenario: Successfully

#   User signs in
#   Enters phone number
#   Sees confirmation message
#   User goes to the verify sms page
#   Submits confirmation code
#   Sees confirmation message