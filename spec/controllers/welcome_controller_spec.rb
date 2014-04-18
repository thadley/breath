require 'spec_helper'

describe WelcomeController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'launch'" do
    it "returns http success" do
      get 'launch'
      response.should be_success
    end
  end

end
