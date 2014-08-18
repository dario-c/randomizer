require 'rails_helper'

RSpec.describe TippsController, :type => :controller do
  
  describe "User Logged in" do   
    it "renders the index template" do
      user = FactoryGirl.create(:user)
      sign_in user   
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "User Not Logged in" do   
    it "Redirects to log in page" do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end


end  