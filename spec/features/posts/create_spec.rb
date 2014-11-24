require 'spec_helper'

describe "Creating posts" do 
  let(:user) { FactoryGirl.create(:user) }

  def create_post(options={})
    options[:title] ||= "A title"
    options[:content] ||= "A description"

    visit new_post_path
    fill_in "Title", with: options[:title]
    fill_in "Content", with: options[:content]
    click_button "Submit Story"
  end

  describe "when user is not signed in" do 
    it "should redirect if the user is not signed in" do 
      visit new_post_path
      expect(page).to have_content("Please sign in")
    end
  end

  describe "when user is signed in" do 
    before do 
      visit login_path
      fill_in "Email", with: user.email 
      fill_in "Password", with: user.password 
      click_button "Log in"
    end

    it "redirects to the posts page on success" do 
      create_post
      expect(page).to have_content("Post created.")
      expect(page).to have_content("A title")
      expect(page).to have_content("A description")
    end

    it "displays an error when the post has no title" do 
      create_post title: ""
      expect(page).to have_content("error")
    end

    it "displays an error when the post title is too short" do 
      create_post title: "hi"
      expect(page).to have_content("error")
    end

    it "displays an error when the post title is too long" do 
      create_post title: "a" * 141
      expect(page).to have_content("error")
    end

    it "displays an error when the content is empty" do 
      create_post content: ""
      expect(page).to have_content("error")
    end

    it "displays an error when the content is too short" do 
      create_post content: "high"
      expect(page).to have_content("error")
    end
  end

end





























