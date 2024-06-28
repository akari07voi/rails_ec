require 'rails_helper'

RSpec.describe "Orderdetails", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/orderdetail/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /detail" do
    it "returns http success" do
      get "/orderdetail/detail"
      expect(response).to have_http_status(:success)
    end
  end

end
