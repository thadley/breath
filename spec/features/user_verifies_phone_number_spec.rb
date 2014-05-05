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
       visit welcome_launch_path
       click_link 'email'
       
    end