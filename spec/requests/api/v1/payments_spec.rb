require 'rails_helper'

RSpec.describe "Api::V1::Payments", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/payments"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/api/v1/payments/1"
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/payments/create"
      expect(response).to have_http_status(:success)
    end
  end

end
