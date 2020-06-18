require 'rails_helper'

RSpec.describe "Counsels", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/counsels/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/counsels/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/counsels/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
