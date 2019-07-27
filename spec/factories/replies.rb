# frozen_string_literal: true

FactoryBot.define do
  factory :reply do
    body { Faker::Lorem.paragraphs.to_s }
    association :user
    association :post
  end
end
