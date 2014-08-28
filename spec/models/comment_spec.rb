require 'rails_helper'

RSpec.describe Comment, :type => :model do
  describe "A valid comment" do
    
    before(:each) do 
      @user = FactoryGirl.create(:user)
      @tipp = FactoryGirl.create(:tipp, user: @user)
      @comment = FactoryGirl.build(:comment, user: @user, tipp: @tipp)
    end

    it "Has a valid factory" do 
      expect(@comment).to be_valid
    end
    
    it "Belongs just to a user" do
      comment_user = @comment.user
      bad_user = FactoryGirl.create :user
      expect(comment_user).to_not eq bad_user
      expect(comment_user).to eq(@user)
    end

    it "Belongs just to a tipp" do
      expect(@comment.tipp).to eq(@tipp)
    end
  end

  describe "A Comment is invalid when..." do 
   
    it "it is longer than 140Chars" do
      comment = FactoryGirl.build(:comment, content: Faker::Lorem.characters(141))

      expect(comment).to be_invalid
    end
  end
end
