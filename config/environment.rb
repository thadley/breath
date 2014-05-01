# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Breath::Application.initialize!

# config.rb from theme
require "sass"

sass_dir = "sass"
css_dir = "css"

output_style = :expanded