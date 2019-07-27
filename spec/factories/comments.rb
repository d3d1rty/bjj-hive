FactoryBot.define do
  factory :comment do
    body { "MyText" }
    association :user
    association :event
  end
end
