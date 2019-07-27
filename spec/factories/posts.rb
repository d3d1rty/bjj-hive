# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    subject { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs.to_s }
    association :user
  end
end
