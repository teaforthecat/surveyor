FactoryBot.define do
  factory :survey do
    sequence(:name) { |n| "survey#{n}"}
  end
end
