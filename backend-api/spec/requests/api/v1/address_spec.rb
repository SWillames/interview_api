require 'rails_helper'

RSpec.describe "Api::V1::Addresses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/address/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/address/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/v1/address/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/address/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/api/v1/address/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
