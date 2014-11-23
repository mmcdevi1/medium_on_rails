require 'spec_helper'

describe User do
  
  describe "relationship with posts" do 
    it { should have_many(:posts) }
  end

  describe "validations" do 
    let(:user) { FactoryGirl.create(:user) }

    it "requires the user to have an email" do 
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do 
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email case insensitive" do 
      user.email = "MMCDEVI1@GMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires an email to look like an email" do 
      user.email = "mike"
      expect(user).to_not be_valid
    end

    it "requires a first name" do 
      expect(user).to validate_presence_of(:first_name)
    end

    it "requires a last name" do 
      expect(user).to validate_presence_of(:last_name)
    end
  end

  describe "#downcase_email" do 
    it "makes the email attribute lower case" do 
      user = User.new(first_name: "m", last_name: "m", email: "M@M.COM", password: "koplop", password_confirmation: "koplop")
      user.downcase_email
      expect(user.email).to eq("m@m.com")
    end
  end

end
