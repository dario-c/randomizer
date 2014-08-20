require 'rails_helper'

RSpec.describe City, :type => :model do

  describe "Correct Data" do 

    it "Is Valid if it has a name" do  
    city = FactoryGirl.build(:city)

    expect(city).to be_valid
    end

    it "Has Tipps associated to it" do
      
    end
  end

  describe "Incorrect Data" do 
  
    it "Is invalid if no name" do
      city = FactoryGirl.build(:city, name:nil)

      expect(city).to be_invalid
    end
  end
end
