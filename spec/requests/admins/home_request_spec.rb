require 'rails_helper'

RSpec.describe "Admins::Homes", type: :request do

  describe "GET /admin_top" do
    it "returns http success" do
      get "/admins/home/admin_top"
      expect(response).to have_http_status(:success)
    end
  end

end
