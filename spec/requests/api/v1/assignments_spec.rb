require 'rails_helper'

RSpec.describe "Api::V1::Assignments", type: :request do
  describe "GET /index" do
    let(:survey) { create(:survey, name: 'xyz') }
    let(:user) { create(:user) }
    let!(:assignment) { create(:assignment, user: user, survey: survey) }
    it "returns assignments for a user" do
      get "/api/v1/assignments", headers: {"ACCEPT" => "application/json"}
      expect(response.status).to eql(200)
      expect(response.body).to include("xyz")
    end
  end
end
