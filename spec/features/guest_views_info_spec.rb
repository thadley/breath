require 'spec_helper'

feature 'Guest views site information' do

    scenario 'Successfully' do
        visit welcome_about_path
        expect( page ).to have_content('about')
    end
end

# Feature: Guest views site information

# Scenario: Successfully
#   Guest goes to about page
#   Guest views information about why this is a powerful practice