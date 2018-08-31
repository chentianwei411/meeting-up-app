require 'rails_helper'

RSpec.describe "ApiV1::Meetings", type: :request do
  describe "GET /api_v1_meetings" do
    it "works! (now write some real specs)" do
      get api_v1_meetings_path
      expect(response).to have_http_status(200)
    end
  end
end
