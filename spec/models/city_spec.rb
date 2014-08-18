require 'rails_helper'

RSpec.describe City, :type => :model do

  describe "Correct Data" do 
    it "Is Valid if it has a name" do  
    city = City.create(name: "barcelona")

    expect(city).to be_valid
    end
  end

  describe "Incorrect Data" do 
  
    it "Is invalid if no name" do
      city = City.create

      expect(city).to be_invalid
    end

  end
  

end
