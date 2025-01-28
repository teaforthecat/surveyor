FactoryBot.define do
  factory :question do
    sequence(:content) { |n| "What number is this? #{n}" }
    sequence(:position) { |n| n }
  end
end
