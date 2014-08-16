require 'rails_helper'

RSpec.describe TippsController, :type => :controller do
  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end
  it "shows 10 Tipps" do 
    get :index
    expect(@random_tipps.count).to eq(10)
  end
end

