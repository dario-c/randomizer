require 'rails_helper'

RSpec.describe "Tipp...", :type => :model do
  
   it "Can be created in the Db" do
    tipp =       Tipp.new
    tipp.name =  "Soul Kitchen"
    tipp.save
    
    expect(Tipp.find(tipp.id).id).to eq(Tipp.first.id)
  end

  it "Requires a name" do 
    tipp = Tipp.create
    
    expect(tipp.id).to eq(nil)
  end

  it "Can have a Streetname" do
    tipp = Tipp.create(name: "Soul Kitchen", streetname: "Elm")
    
    expect(tipp.name).to eq("Soul Kitchen")
    expect(tipp.streetname).to eq("Elm")
  end
  # it "Has at least 10 Tipps" do
  #   expect(Tipp.count).to eq(10)
  # end



end

