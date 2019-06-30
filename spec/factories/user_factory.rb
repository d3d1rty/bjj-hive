# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    handle { Faker::Internet.username.slice(0, 14) }
    organizer { false }
    admin { false }

    trait :is_organizer do
      organizer { true }
    end

    trait :is_admin do
      admin { true }
    end
  end
end
