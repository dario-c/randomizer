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

  describe "An Ambassador" do

    before(:each) do 
     @user = FactoryGirl.build(:user, role:"ambassador")  
    end

    it "receives 2 Karma points when creating a Tipp" do
      user_before = @user.karma
      @user.update_karma("created")
    
      expect(@user.karma - user_before).to eql(2)
    end

    it "receives 1 Karma points when commenting a Tipp" do
      user_before = @user.karma
      @user.update_karma("commented")
    
      expect(@user.karma - user_before).to eql(1)
    end

    it "receives 1 Karma points when someone up votes his Tipp" do
      user_before = @user.karma
      @user.update_karma("upvoted")
    
      expect(@user.karma - user_before).to eql(1)
    end
    
    it "loses 1 Karma points when someone down votes his Tipp" do
      user_before = @user.karma
      @user.update_karma("downvoted")
    
      expect(@user.karma - user_before).to eql(-1)
    end

    it "receives 1 Karma Point when another user comments on his Tipp" do
      user_before = @user.karma
      @user.update_karma("vouched")
    
      expect(@user.karma - user_before).to eql(1)
    end


  end

  describe "A Regular user" do

    before(:each) do 
     @user = FactoryGirl.build(:user, role:"ambassador")  
    end

    it "receives 2 Karma points when creating a Tipp" do
      user_before = @user.karma
      @user.update_karma("created")
    
      expect(@user.karma - user_before).to eql(2)
    end

    it "receives 1 Karma points when commenting a Tipp" do
      user_before = @user.karma
      @user.update_karma("commented")
    
      expect(@user.karma - user_before).to eql(1)
    end

    it "receives 1 Karma points when someone up votes his Tipp" do
      user_before = @user.karma
      @user.update_karma("upvoted")
    
      expect(@user.karma - user_before).to eql(1)
    end

    it "loses 1 Karma points when someone down votes his Tipp" do
      user_before = @user.karma
      @user.update_karma("downvoted")
    
      expect(@user.karma - user_before).to eql(-1)
    end  

    it "receives 1 Karma Point when another user comments on his Tipp" do
      user_before = @user.karma
      @user.update_karma("vouched")
    
      expect(@user.karma - user_before).to eql(1)
    end

  end

  describe "A Badkarma user" do

    before(:each) do 
     @user = FactoryGirl.build(:user, role:"badkarma")  
    end

    it "does not receive karma when creating a Tipp" do
      user_before = @user.karma
      @user.update_karma("created")
    
      expect(@user.karma - user_before).to eql(0)
    end

    it "does not receive Karma points when commenting a Tipp" do
      user_before = @user.karma
      @user.update_karma("commented")
    
      expect(@user.karma - user_before).to eql(0)
    end

    it "does not receive Karma when someone up votes his Tipp" do
      user_before = @user.karma
      @user.update_karma("upvoted")
    
      expect(@user.karma - user_before).to eql(0)
    end
    
    it "does not receive Karma  when someone up votes his Tipp" do
      user_before = @user.karma
      @user.update_karma("downvoted")
    
      expect(@user.karma - user_before).to eql(0)
    end
    
    it "receives 1 Karma Point ONLY when another user comments on his Tipp" do
      user_before = @user.karma
      @user.update_karma("vouched")
    
      expect(@user.karma - user_before).to eql(1)
    end

  end

end
