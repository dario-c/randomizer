require 'rails_helper'
  
RSpec.describe Tipp, :type => :model do

  it "Has a valid factory" do
    tipp = FactoryGirl.build(:tipp)

    expect(tipp).to be_valid
  end

  it "Can be created in the Db" do
    tipp = FactoryGirl.create(:tipp)

    expect(tipp.id).to be_truthy
  end

  it "Requires a name" do 
    tipp = FactoryGirl.build(:tipp, name: nil)
    expect(tipp).to be_invalid
  end

  it "Can have a Streetname" do
    tipp = FactoryGirl.build(:tipp, streetname:"Elm Street")

    expect(tipp.streetname).to eq("Elm Street")
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

