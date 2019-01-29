require 'rails_helper'

RSpec.describe "Admin::Missions", type: :request do
  describe "GET /admin_missions" do
    it "works! (now write some real specs)" do
      get admin_missions_path
      expect(response).to have_http_status(200)
    end
  end
end
