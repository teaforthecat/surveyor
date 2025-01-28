require 'rails_helper'

RSpec.describe "Api::V1::Answers", type: :request do
  describe "POST /api/v1/answers" do
    let(:survey) { create(:survey, name: 'xyz') }
    let(:user) { create(:user) }
    let!(:assignment) { create(:assignment, user: user, survey: survey) }
    let!(:question) { create(:question, position: 1, survey: survey)}
    let!(:question2) { create(:question, position: 2, survey: survey)}

    it "stores answers to questions from a user" do
      post "/api/v1/answers",
           params: {answer: {question_id: question.id,
                             assignment_id: assignment.id,
                             content: "blue"}},
           headers: {"ACCEPT" => "application/json"}
      expect(response.status).to eql(204)
      expect(response.body).to be_empty
      expect(assignment.reload.completed_at).to be_nil
    end

    it "marks an assignment completed when the last question is answered" do
       post "/api/v1/answers",
           params: {answer: {question_id: question.id,
                             assignment_id: assignment.id,
                             content: "blue"}},
           headers: {"ACCEPT" => "application/json"}
      expect(response.status).to eql(204)
      expect(response.body).to be_empty
      expect(assignment.reload.completed_at).to be_nil
      # Question2
      post "/api/v1/answers",
           params: {answer: {question_id: question2.id,
                             assignment_id: assignment.id,
                             content: "red"}},
           headers: {"ACCEPT" => "application/json"}

      expect(response.status).to eql(204)
      expect(assignment.reload.completed_at).to be_present
    end
  end
end
