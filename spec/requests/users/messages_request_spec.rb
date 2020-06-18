require 'rails_helper'

RSpec.describe "Users::Messages", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/users/messages/index"
      expect(response).to have_http_status(:success)
    end
  end

end
