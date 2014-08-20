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

    it "Gives 10 Tipps" do
      expect(Tipp.all.count).to be(10)
    end  

    it "Tipps are Random" do
      one = Tipp.random_ten
      two = Tipp.random_ten
      
      expect(one==two).to be(false)
    end
  end
end
