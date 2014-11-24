require 'spec_helper'

describe "Creating posts" do 
  let(:user) { FactoryGirl.create(:user) }

  it "should redirect if the user is not signed in" do 
    visit new_post_path
    expect(page).to have_content("New post")
  end
end