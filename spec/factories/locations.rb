# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { 'MyString' }
    street_address { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    zip { 'MyString' }
    country { 'MyString' }
    association :user
  end
end
