require 'rails_helper'

RSpec.describe TippsController, :type => :controller do
   
  describe "If User is logged in..." do 
    before(:each) do  
      user = FactoryGirl.create(:user)
      sign_in user   
    end

    it "Is directed to the Index" do
      get :index
      expect(response).to render_template("index")
    end
    
    it "is showed the New form" do
      get :new 
      expect(response).to render_template("new")   
    end

    context"when creating a new Tipp..."do

      it "can create a correct Tipp" do
        post :create, tipp: {name:"A Place", streetname:"A Street", user_id: 1, city_id: 1}
        expect(flash[:notice]).to match("Thanks for your Tipp!") 
        expect(response).to redirect_to(tipps_path)
      end

      it "can add a comment to the Tipp" do
        post :create, tipp: {name:"A Place", streetname:"A Street", user_id: 1, city_id: 1, :comments_attributes => { '0'=>{'content'=>"I am a comment!"}}}
        expect(Comment.last.content).to match("I am a comment!")
      end

      it "is noticed when form is incorrect" do 
        post :create, tipp: {name:"A Place", streetname:"A Street", user_id: nil, city_id: 1}
        expect(flash[:error]).to be_truthy
      end

      it "redirected back when form is incorrect" do 
        post :create, tipp: {name:nil, streetname:"A Street", user_id: 1, city_id: 1}
        expect(response).to redirect_to(new_tipp_path)
      end

   end

    end 

  describe "If user is not logged in..." do
    it "is directed to the Index" do
    get :index
    expect(response).to render_template("index")
    end

    context "it is redirected to new_user_path when..." do
      it "tries to create a new Tipp" do
        get :new 
        expect(response).to redirect_to(new_user_session_path)
      end   
    end    
  end

#expect(response).to redirect_to(new_user_session_path)
    
end  