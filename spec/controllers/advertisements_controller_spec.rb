require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:my_advertisement) { Advertisement.create!(title: RandomData.random_word, copy: RandomData.random_paragraph, price: rand(100...1000)) }
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  it "assigns [my_advertisement] to @advertisements" do
    get :index
    
    expect(assigns(:advertisements)).to eq ([my_advertisement])
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_advertisement.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: my_advertisement.id }
      expect(response).to render_template :show
    end

    it "assign my_advertisement to @advertisements" do
      get :show, params: { id: my_advertisement.id }
      expect(assigns(:advertisement)).to eq(my_advertisement)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "ADVERTISEMENT #create" do
   it "increase the number of Advertisements by 1" do
    expect { my_advertisement }.to change(Advertisement,:count).by(1)
   end
  end

end
