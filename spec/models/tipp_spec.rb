require 'spec_helper' #rails_helper?

# RSpec.describe "Tipp...", :type => :model do
  
  describe Tipp do

  it "Has a valid factory" do
    atipp = FactoryGirl.create(:tipp)

    expect(atipp).to be_truthy
  end

  it "Can be created in the Db" do
    atipp = FactoryGirl.create(:tipp)

    expect(atipp.id).to be_truthy
  end

  it "Requires a name" do 
    atipp = FactoryGirl.build(:tipp, name: nil)
    expect(atipp.id).to be_nil
  end

  it "Can have a Streetname" do
    atipp = FactoryGirl.build(:tipp, streetname:"Elm Street")

    expect(atipp.streetname).to eq("Elm Street")
  end

end

describe "Random Method" do
  it "Gives 10 Tipps" do
    10.times {FactoryGirl.create(:tipp)}
    expect(Tipp.all.count).to be(10)
  end  

  it "Tipps are Random" do
    one = FactoryGirl.create(:tipp)
    two = FactoryGirl.create(:tipp)
    
    expect(one==two).to be(false)
  end

end

