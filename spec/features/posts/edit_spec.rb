require 'spec_helper'

describe "Editing posts" do 
  let(:user)  { FactoryGirl.create(:user) }
  let(:user2) { User.create(first_name: "m", 
                            last_name: "m",
                            email: "m@m.com",
                            password: "koplop",
                            password_confirmation: "koplop") }
  let(:post)  { Post.create(title: "title", content: "content", user_id: user.id) }  
  let(:post_from_user2)  { Post.create(title: "title", content: "content", user_id: user2.id) } 

  def update_post(options={})
    options[:title] ||= "A title"
    options[:content] ||= "A description"

    post = options[:post]

    visit edit_post_path(post)
    expect(page).to have_content(post.title)
    fill_in "Title", with: options[:title]
    fill_in "Content", with: options[:content]
    click_button "Update Story"
  end 

  describe "when user is not signed in" do 
    it "should redirect if the user is not signed in" do 
      visit edit_post_path(post)
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
      
    describe "when current_user does not equal post.user" do 
      it "should redirect to root path if a user tries to edit another users post" do 
        visit edit_post_path(post_from_user2)
        expect(page).to have_content("You can't do that")
      end
    end

    describe "with valid attributes" do 
      it "should update post successfully" do 
        update_post post: post, title: "New title", content: "New content"
        post.reload
        expect(page).to have_content("Post updated")
        expect(post.title).to eq("New title")
        expect(post.content).to eq("New content")
      end

      it "displays an error when the post has no title" do 
        update_post post: post, title: ""
        expect(page).to have_content("error")
      end

      it "displays an error when the posts title is too short" do 
        update_post post: post, title: "hi"
        expect(page).to have_content("error")
      end

      it "displays an error when the content is empty" do 
        update_post post: post, content: ""
        expect(page).to have_content("error")
      end

      it "displays an error when the content is too short" do 
        update_post post: post, content: "high"
        expect(page).to have_content("error")
      end
    end
  end

end

























