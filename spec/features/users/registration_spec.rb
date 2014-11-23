require 'spec_helper'

describe "registering new users" do 
  it "successfully creates a new user in the database" do 
    visit root_path
    click_link "Register"
  end
end