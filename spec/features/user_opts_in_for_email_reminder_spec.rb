require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

user = FactoryGirl.create(:user)
user.save

feature 'opts in for email reminder' do

  before :each do
    logout(:user)
    visit new_user_session_path
  end

    scenario 'Successfully' do
       login_as(user, :scope => :user)
       visit welcome_launch_path
       # navigate to user_edit_path with link to 'Sign out'
       click_link 'email'
       expect( page ). to have_content('Sign out')
       email_box = find(:css, ".emailCheckbox")
       email_box.should_not be_checked
       email_box.set(true)
       click_button('Save')
       expect( page ).to have_content('User information updated')
    end
end

# Feature: User opts in for email reminder

# Scenario: Successfully
#   User signs in and visits profile page
#   Checks 'send email' checkbox
#   Sees confirmation message