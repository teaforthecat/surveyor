require 'rails_helper'

RSpec.describe "Api::V1::Questions", type: :request do

  describe "GET /api/v1/assignments/1/questions" do
    let(:survey) { create(:survey, name: 'xyz') }
    let(:user) { create(:user) }
    let!(:assignment) { create(:assignment, user: user, survey: survey) }
    let!(:question) { create(:question, survey: survey)}
    let!(:question2) { create(:question, survey: survey)}

    it "stores answers to questions from a user" do
      get "/api/v1/assignments/#{assignment.id}/questions",
           headers: {"ACCEPT" => "application/json"}
      expect(response.status).to eql(200)
      expect(response.body).to include("content\":")
      expect(response.body).to include("position\":")
    end
  end
end
