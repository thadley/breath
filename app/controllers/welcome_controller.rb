class WelcomeController < ApplicationController
  def about
    @user = current_user
  end

  def launch
  end
end
