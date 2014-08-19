require 'rails_helper'

RSpec.describe Comment, :type => :model do
  describe "A valid comment" do
    
    before(:each) do 
    @comment = FactoryGirl.build(:comment)
    end

    it "Has a valid factory" do 
      expect(@comment).to be_valid
    end
    
    it "Belongs to a user" do
      expect(@comment.user_id).to eq(2)
    end

    it "Belongs to a tipp" do
      expect(@comment.tipp_id).to eq(1)
    end
  end

  describe "A Comment is invalid when..." do 
   
    it "it is longer than 140Chars" do
      comment = FactoryGirl.build(:comment, content: Faker::Lorem.characters(141))

      expect(comment).to be_invalid
    end
  end

  describe "A Comment is deleted when..." do
    
    it "is not related to a user" do
      comment = FactoryGirl.build(:comment, user_id: nil)

      expect(Comment.find_by(id: comment.id)).to be_falsy

    end
  
    it "is not related to a tipp" do
        comment = FactoryGirl.build(:comment, tipp_id: nil)

        expect(Comment.find_by(id: comment.id)).to be_falsy
      end
    
  end

end
