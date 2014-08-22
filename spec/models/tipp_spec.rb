require 'rails_helper'

RSpec.describe Tipp, :type => :model do

  describe "A valid Tipp..." do

    before(:each) do 
      @tipp = FactoryGirl.build(:tipp)
    end

    it "Has a valid factory" do
      tipp = FactoryGirl.build(:tipp)

      expect(tipp).to be_valid
    end

    it "Can be created in the Db" do
      tipp = FactoryGirl.create(:tipp)

      expect(tipp.id).to be_truthy
    end

    it "has a name" do 
      expect(@tipp.name).to be_truthy
    end    

    it "has a streetname" do 
      expect(@tipp.streetname).to be_truthy
    end

    it "belongs to a City" do 
      expect(@tipp.city_id).to eq(1)
    end

    it "belongs to a User" do 
      expect(@tipp.user_id).to eq(1)
    end

    it "starts with 0 Points" do
      expect(@tipp.points).to eq(0)
    end

    it "can have an image associated" do
      expect(@tipp.image).to be_truthy
      
    end

  end

  describe "An invalid Tipp..." do

    it "has no name" do 
      tipp = FactoryGirl.build(:tipp, name: nil)
      expect(tipp).to be_invalid
    end

    it "has the same name as an exisiting one" do
      tipp = FactoryGirl.create(:tipp, name: "Mob")
      tipp2 = FactoryGirl.build(:tipp, name: "mob")

      expect(tipp2).to be_invalid
    end

    it "has no streetname" do
      tipp = FactoryGirl.build(:tipp, streetname:nil)

      expect(tipp).to be_invalid
    end    

    it "does not belong to any city" do
      tipp = FactoryGirl.build(:tipp, city_id:nil)

      expect(tipp).to be_invalid
    end

    it "does not belong to any user" do
      tipp = FactoryGirl.build(:tipp, user_id:nil)

      expect(tipp).to be_invalid
    end
  end

  describe "Random Method" do

    before(:each) do 
      10.times {FactoryGirl.create(:tipp)}
    end

    it "Gives 5 Tipps" do
      expect(Tipp.random_five.count).to be(5)
    end  

    it "Tipps are Random" do
      one = Tipp.random_five
      two = Tipp.random_five
      
      expect(one==two).to be(false)
    end
  end

  describe "Update Points method..." do
      
    context 'when the user is a Regular user...' do
    
      before(:each) do 
        @user = FactoryGirl.create(:user, role: "regular")
        @tipp = FactoryGirl.create(:tipp, user_id: @user.id)
      end

      it "he creates Tipps with 10 Points " do
        @tipp.update_points("created", @user.role)
        expect(@tipp.points).to eq(10)
      end

      it "he adds 5 Points to Tipps with comments" do
        pre_update = @tipp.points
        @tipp.update_points("commented","regular")
        
        expect(@tipp.points - pre_update).to eq(5)
      end

    end

    context 'when the user is an Ambassador...' do

      before(:each) do 
        @user = FactoryGirl.create(:user, role: "ambassador")
        @tipp = FactoryGirl.create(:tipp, user_id: @user.id)
      end

      it "he creates Tipps with 100 Points " do
        @tipp.update_points("created", @user.role)

        expect(@tipp.points).to eq(100)
      end

      it "he adds 10 Points to Tipps with comments" do
        pre_update = @tipp.points
        @tipp.update_points("commented",@user.role)
        
        expect(@tipp.points - pre_update).to eq(10)
      end
    end
  end
end
