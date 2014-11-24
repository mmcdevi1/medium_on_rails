require 'spec_helper'

describe Post do
  
  describe "relationship with users" do 
    it { should belong_to(:user) }
  end

  describe "validations" do 
    let(:post)  { Post.create(title: "title", content: "content", user_id: 1) }  

    it "requires the post to have a title" do 
      expect(post).to validate_presence_of(:title)
    end

    it "requires the post to have content" do 
      expect(post).to validate_presence_of(:content)
    end
  end

end
