require 'spec_helper'

describe "registering new users" do 
  it "successfully creates a new user in the database" do 
    visit root_path
    click_link "Register"  
    expect(page).to have_selector('h2', text: "Register") 
    fill_in "First Name", with: "Michael"
    fill_in "Last Name", with: "McDevitt"
    fill_in "Email", with: "mmcdevi1@gmail.com"
    fill_in "Password", with: "koplop"
    fill_in "Password confirmation", with: "koplop"
    click_button "Register"
    expect(page).to have_content('Successfully registered with Medium.')
  end
end