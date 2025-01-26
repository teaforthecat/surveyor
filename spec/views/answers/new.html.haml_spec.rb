require 'rails_helper'

RSpec.describe "answers/new", type: :view do
  before(:each) do
    assign(:answer, Answer.new(
      user: nil,
      question: nil,
      assignment: nil,
      content: "MyText"
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input[name=?]", "answer[user_id]"

      assert_select "input[name=?]", "answer[question_id]"

      assert_select "input[name=?]", "answer[assignment_id]"

      assert_select "textarea[name=?]", "answer[content]"
    end
  end
end
