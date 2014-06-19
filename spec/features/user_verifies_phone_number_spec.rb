require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
user.save


feature 'verifies phone number' do

  before :each do
    logout(:user)
    visit new_user_session_path
  end

    scenario 'Successfully' do
       login_as(user, :scope => :user)
       visit edit_profile_path
       fill_in 'user_phone_number', with: '1234567890'
       click_button 'Save'
       expect(page).to have_content('A verification code was sent to your phone')
       visit users_verify_sms_path
       fill_in 'user_sms_verification_code_conf', with: :sms_confirmation_code
       click_button 'Save'

    end
end


# Feature: User verifies phone number

# Scenario: Successfully

#   User signs in
#   Enters phone number
#   Sees verification code sent confirmation message
#   User goes to the verify sms page
#   Submits confirmation code
#   Sees confirmation message