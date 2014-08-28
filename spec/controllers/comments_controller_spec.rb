require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
   
  describe "If User is logged out..." do 

    it "is directed to Signup" do
      get :new
      expect(response).to redirect_to(new_user_session_path)
      
      get :create
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "If User is logged in.." do  

    before(:each) do  
      user = FactoryGirl.create(:user)
      sign_in user   
    end
    
    it "is shown the comment form" do
      get :new 
      expect(response).to render_template("new")   
    end
  end

  describe "when creating a correct Comment..." do 
    before(:each) do 
      owner = FactoryGirl.create(:user)
      @tipp = FactoryGirl.create(:tipp, user_id: owner.id)
      @user = FactoryGirl.create(:user, karma: 10)
      sign_in @user
         
      @correct_post = (post :create, comment: {content:"I love their Tacos!", user_id: @user.id, tipp_id: @tipp.id})
    end

    it "it can create a correct comment" do
      
      expect(response).to redirect_to(new_tipp_path)
    end

    it "Notices the user of the success" do

      expect(flash[:notice]).to be_truthy
    end

    it "relates the comment to a Tipp" do 

      expect(Comment.last.tipp_id).to eq(@tipp.id)
    end
    
    it "relates the comment to a User" do 

      expect(Comment.last.user_id).to eq(@user.id)
    end
  end
end