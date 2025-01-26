require 'rails_helper'

RSpec.describe "answers/edit", type: :view do
  let(:answer) {
    Answer.create!(
      user: nil,
      question: nil,
      assignment: nil,
      content: "MyText"
    )
  }

  before(:each) do
    assign(:answer, answer)
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(answer), "post" do

      assert_select "input[name=?]", "answer[user_id]"

      assert_select "input[name=?]", "answer[question_id]"

      assert_select "input[name=?]", "answer[assignment_id]"

      assert_select "textarea[name=?]", "answer[content]"
    end
  end
end
