require 'rails_helper'

RSpec.describe Tipp, :type => :model do

  describe "A valid Tipp..." do

    before(:each) do 
      @city = FactoryGirl.create(:city)
      @user = FactoryGirl.create(:user)
      @tipp = FactoryGirl.build(:tipp, city: @city, user: @user)
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

    it "belongs to a specific City" do
      wrong_city = FactoryGirl.create(:city)
      expect(@tipp.city).to_not eq(wrong_city)
      expect(@tipp.city).to eq(@city)
    end

    it "belongs to a specific User" do 
      wrong_user = FactoryGirl.create(:user)
      expect(@tipp.user).to eq(@user)
      expect(@tipp.user).to_not eq(wrong_user)
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
      tipp = FactoryGirl.build(:tipp, city:nil)

      expect(tipp).to be_invalid
    end

    it "does not belong to any user" do
      tipp = FactoryGirl.build(:tipp, user:nil)

      expect(tipp).to be_invalid
    end
  end

  describe "Random Method" do

    before(:each) do 
      end

    it "Gives 5 Tipps" do
      10.times { FactoryGirl.create(:tipp, offer: false, points: 10) }
   
      expect(Tipp.random_five(true).count).to be(5)
    end  

    it "Tipps are Random" do
      10.times { FactoryGirl.create(:tipp, offer: false, points: 10) }

      one = Tipp.random_five(false)
      two = Tipp.random_five(false)
      
      expect(one==two).to be(false)
    end

    it "shows offers only to Signed-in users" do
      4.times { FactoryGirl.create(:tipp, offer: false, points: 10) }
      6.times { FactoryGirl.create(:tipp, offer: true, points: 10) }
      
      expect(Tipp.random_five(false).count).to be < 5
    end

    it "shows only those with Positive Points" do
      4.times { FactoryGirl.create(:tipp, offer: true, points: 10) }
      6.times { FactoryGirl.create(:tipp, offer: true, points: -10) }
      
      expect(Tipp.random_five(true).count).to be < 5
    end
  end

  describe "find_these Method" do

    it "finds those tipps that are asked for" do
      one = FactoryGirl.create(:tipp)
      two = FactoryGirl.create(:tipp)
      three = FactoryGirl.create(:tipp)

      method = Tipp.find_these([one,three])[0]
      method_again = Tipp.find_these([one,two])[1]
      no_method = Tipp.find(one)
      no_method_again = Tipp.find(two)

      expect(method).to eq(no_method)
      expect(method_again).to eq(no_method_again)
    end
  end

  describe "Update Points method..." do
      
    context 'when the user is a Regular user...' do
    
      before(:each) do 
        @user = FactoryGirl.create(:user, role: "regular")
        @tipp = FactoryGirl.create(:tipp, user: @user)
      end

      it "he creates Tipps with 10 Points " do
        @tipp.update_points("created", @user.role)
        expect(@tipp.points).to eq(10)
      end

      it "he adds 5 Points to Tipps with comments" do
        expect { @tipp.update_points("commented","regular")
                }.to change(@tipp, :points).by(5)
      end

      it "he adds 1 Point when up voting" do
        pre_update = @tipp.points
        @tipp.update_points("was_upvoted", @user.role)
        
        expect(@tipp.points - pre_update).to eq(1)
     end

     it "he takes 1 Point when down voting" do
       pre_update = @tipp.points
       @tipp.update_points("was_downvoted", @user.role)
       
       expect(@tipp.points - pre_update).to eq(-1)               
     end

    end

    context 'when the user is an Ambassador...' do

      before(:each) do 
        @user = FactoryGirl.create(:user, role: "ambassador")
        @tipp = FactoryGirl.create(:tipp, user: @user)
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

       it "he adds 1 Point when up voting" do
         pre_update = @tipp.points
         @tipp.update_points("was_upvoted", @user.role)
         
         expect(@tipp.points - pre_update).to eq(1)
      end

      it "he takes 1 Point when down voting" do
        pre_update = @tipp.points
        @tipp.update_points("was_downvoted", @user.role)
        
        expect(@tipp.points - pre_update).to eq(-1)         
      end
    end

    context 'when the user is a Badkarma...' do

      before(:each) do 
        @user = FactoryGirl.create(:user, role: "badkarma")
        @tipp = FactoryGirl.create(:tipp, user: @user)
      end

      it "he creates Tipps with NO Points " do
        @tipp.update_points("created", @user.role)

        expect(@tipp.points).to eq(0)
      end

      it "he adds NO to Tipps with comments" do
        pre_update = @tipp.points
        @tipp.update_points("commented",@user.role)
        
        expect(@tipp.points - pre_update).to eq(0)
      end

      it "he adds NO Points when up voting" do
         pre_update = @tipp.points
         @tipp.update_points("was_upvoted", @user.role)
         
         expect(@tipp.points - pre_update).to eq(0)
      end

      it "he takes NO Points when down voting" do
        pre_update = @tipp.points
        @tipp.update_points("was_downvoted", @user.role)
        
        expect(@tipp.points - pre_update).to eq(0)
      end
    end
  end
end

