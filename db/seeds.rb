# frozen_string_literal: true

require 'faker'

Event.delete_all
Location.delete_all
User.delete_all

def create_organizer(number)
  User.create!(
    email: "organizer#{number}@test.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'Password1!',
    handle: "organizer#{number}",
    admin: false,
    organizer: true
  )
end

def create_user(number)
  User.create!(
    email: "user#{number}@test.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'Password1!',
    handle: "user#{number}",
    admin: false,
    organizer: false
  )
end

def create_admin(number)
  User.create!(
    email: "admin#{number}@test.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'Password1!',
    handle: "admin#{number}",
    admin: true,
    organizer: false
  )
end

10.times do |index|
  user = create_organizer(index)
  location_kc = Location.create!(
    name: "Kansas City Gym #{index}",
    street_address: '5860 Beverly Avenue',
    city: 'Mission',
    state: 'KS',
    zip: '66202',
    country: 'USA',
    latitude: 39.022904,
    longitude: -94.656135,
    user: user
  )

  5.times do
    Event.create!(
      name: Faker::Coffee.blend_name,
      summary: Faker::Markdown.sandwich(5),
      start_date: '2020-05-30',
      start_time: '06:00:00',
      end_date: '2020-05-30',
      end_time: '09:00:00',
      time_zone: 'Central Time (US & Canada)',
      category: 'Class',
      location: location_kc,
      user: user
    )
  end

  location_tn = Location.create!(
    name: "Clarksville Gym #{index}",
    street_address: '405 North Riverside Drive',
    city: 'Clarksville',
    state: 'TN',
    zip: '37040',
    country: 'USA',
    latitude: 36.530693,
    longitude: -87.364152,
    user: user
  )

  5.times do |_index|
    Event.create!(
      name: Faker::Coffee.blend_name,
      summary: Faker::Markdown.sandwich(5),
      start_date: '2020-05-30',
      start_time: '06:00:00',
      end_date: '2020-05-30',
      end_time: '09:00:00',
      time_zone: 'Central Time (US & Canada)',
      category: 'Class',
      location: location_tn,
      user: user
    )
  end
end

5.times do |index|
  create_user(index)
end

3.times do |index|
  create_admin(index)
end
