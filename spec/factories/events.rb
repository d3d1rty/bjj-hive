# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'MyString' }
    summary { '<p>In a <i>million</i> stars!</p>' }
    category { 'Conference' }
    fee { '9.99' }
    start_date { Time.now }
    end_date { Time.now + 1.hours }
    time_zone { 'Central Time (US & Canada)' }
    association :user
    association :location

    factory :event_with_comments do
      transient do
        comments_count { 5 }
      end

      after(:create) do |event, evaluator|
        create_list(:comment, evaluator.comments_count, event: event)
      end
    end
  end
end
