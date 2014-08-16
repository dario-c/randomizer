require 'rails_helper'

RSpec.describe Tipp, :type => :model do
  
   it "Creates a Tipp" do
    tipp = Tipp.new
    tipp.name = "Soul Kitchen"
    tipp.save
    expect(Tipp.find(tipp.id).id).to eq(Tipp.first.id)
  end

end
