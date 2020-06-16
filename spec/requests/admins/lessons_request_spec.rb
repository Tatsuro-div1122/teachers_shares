require 'rails_helper'

RSpec.describe "Admins::Lessons", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/lessons/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/lessons/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admins/lessons/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
