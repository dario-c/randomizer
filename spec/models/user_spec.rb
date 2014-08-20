require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "A valid User" do 

    before(:each) do 
      @user = FactoryGirl.build(:user)
    end
    
    it "Has a name" do
      expect(@user).to  be_valid
    end

    it "Has an email" do
      expect(@user.email).to  be_truthy
    end

    it "Has password" do
      expect(@user.password).to  eq("qwerty124")
    end

    it "Has rol: regular as default" do
      expect(@user.role).to  eq("regular")
    end  

    it "Can have rol: Ambassador" do
      user = FactoryGirl.build(:user, role:"ambassador")
      
      expect(user.role).to  eq("ambassador")
    end
  end

  describe "An invalid User" do 

    it "Has no name" do
      user = FactoryGirl.build(:user, name: nil)

      expect(user).to be_invalid
    end

    it "Has no email" do
      user = FactoryGirl.build(:user, email: nil)

      expect(user).to be_invalid
    end

    it "Has no role assigned" do   
      user = FactoryGirl.build(:user, role: nil)

      expect(user).to be_invalid
    end
  end
end
