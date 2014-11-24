require 'spec_helper'

describe "Logging in" do 
  let(:user) { FactoryGirl.create(:user) }

  it "successfully logs the user in" do 
    visit login_path
    expect(page).to have_content("Log in")
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password 
    click_button "Log in"
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content("You are logged in.")
  end
end