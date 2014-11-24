require 'spec_helper' 

describe "Deleting posts" do 
  let(:user)  { FactoryGirl.create(:user) }
  let!(:post)  { user.posts.create(title: "title", content: "content") }  

  before do 
    visit login_path
    fill_in "Email", with: user.email 
    fill_in "Password", with: user.password 
    click_button "Log in"
  end

  it "successfully deletes a post" do 
    visit user_path(user)
    full_name = user.first_name + " " + user.last_name
    expect(page).to have_content(full_name)
    expect(page).to have_content(post.title)

    within "#post_#{post.id}" do 
      click_link "Delete"
    end

    expect(page).to have_content("Post deleted")
  end
end