require 'rails_helper'

RSpec.describe "Api::V1::Documents", type: :request do
  describe "GET /list" do
    it "returns http success" do
      get "/api/v1/documents/list"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/api/v1/documents/create"
      expect(response).to have_http_status(:success)
    end
  end

end
