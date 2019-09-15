# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'MyString' }
    summary { '<p>In a <i>million</i> stars!</p>' }
    category { 'Conference' }
    fee { '9.99' }
    start_date { '2019-04-19' }
    start_time { '19:10:38' }
    end_date { '2019-04-19' }
    end_time { '19:11:38' }
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
