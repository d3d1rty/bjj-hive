# frozen_string_literal: true

FactoryBot.define do
  factory :favorite_event do
    association :user
    association :event
  end
end
