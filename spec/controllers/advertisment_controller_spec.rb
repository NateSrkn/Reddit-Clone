require 'rails_helper'

RSpec.describe AdvertismentController, type: :controller do

  describe "GET #title:string" do
    it "returns http success" do
      get :title:string
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #copy:text" do
    it "returns http success" do
      get :copy:text
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #price:integer" do
    it "returns http success" do
      get :price:integer
      expect(response).to have_http_status(:success)
    end
  end

end
