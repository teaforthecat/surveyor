require 'rails_helper'

RSpec.describe "answers/index", type: :view do
  before(:each) do
    assign(:answers, [
      Answer.create!(
        user: nil,
        question: nil,
        assignment: nil,
        content: "MyText"
      ),
      Answer.create!(
        user: nil,
        question: nil,
        assignment: nil,
        content: "MyText"
      )
    ])
  end

  it "renders a list of answers" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
