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
       visit user_path(:id)
       expect( page ). to have_content('Sign out')
       sms_box = find(:css, ".smsCheckbox")
       sms_box.should_not be_checked
       sms_box.set(true)
       click_button('Save')
       expect( page ).to have_content('User information updated')
    end
end