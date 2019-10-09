# frozen_string_literal: true
# 
# require 'faker'
# 
# Event.delete_all
# Location.delete_all
# User.delete_all
# 
# def create_organizer(number)
#   User.create!(
#     email: "organizer#{number}@test.com",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password: 'Password1!',
#     handle: "organizer#{number}",
#     admin: false,
#     organizer: true
#   )
# end
# 
# def create_user(number)
#   User.create!(
#     email: "user#{number}@test.com",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password: 'Password1!',
#     handle: "user#{number}",
#     admin: false,
#     organizer: false
#   )
# end
# 
# def create_admin(number)
#   User.create!(
#     email: "admin#{number}@test.com",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password: 'Password1!',
#     handle: "admin#{number}",
#     admin: true,
#     organizer: false
#   )
# end
# 
# 10.times do |index|
#   user = create_organizer(index)
#   location_kc = Location.create!(
#     name: "Kansas City Gym #{index}",
#     street_address: '5860 Beverly Avenue',
#     city: 'Mission',
#     state: 'KS',
#     zip: '66202',
#     country: 'USA',
#     latitude: 39.022904,
#     longitude: -94.656135,
#     user: user
#   )
# 
#   5.times do
#     Event.create!(
#       name: Faker::Coffee.blend_name,
#       summary: Faker::Markdown.sandwich(5),
#       start_date: '2020-05-30',
#       start_time: '06:00:00',
#       end_date: '2020-05-30',
#       end_time: '09:00:00',
#       time_zone: 'Central Time (US & Canada)',
#       category: 'Class',
#       location: location_kc,
#       user: user
#     )
#   end
# 
#   location_tn = Location.create!(
#     name: "Clarksville Gym #{index}",
#     street_address: '405 North Riverside Drive',
#     city: 'Clarksville',
#     state: 'TN',
#     zip: '37040',
#     country: 'USA',
#     latitude: 36.530693,
#     longitude: -87.364152,
#     user: user
#   )
# 
#   5.times do |_index|
#     Event.create!(
#       name: Faker::Coffee.blend_name,
#       summary: Faker::Markdown.sandwich(5),
#       start_date: '2020-05-30',
#       start_time: '06:00:00',
#       end_date: '2020-05-30',
#       end_time: '09:00:00',
#       time_zone: 'Central Time (US & Canada)',
#       category: 'Class',
#       location: location_tn,
#       user: user
#     )
#   end
# end
# 
# 5.times do |index|
#   create_user(index)
# end
# 
# 3.times do |index|
#   create_admin(index)
# end
#

locations = [
  {
    name: 'Glory Mixed Martial Arts & Fitness - Gladstone',
    street_address: '7275 N Oak Trafficway',
    city: 'Gladstone',
    state: 'Missouri',
    zip: '64118',
    country: 'USA'
  },
  {
    name: 'KCBJJ',
    street_address: '5860 Beverly Avenue',
    city: 'Mission',
    state: 'KS',
    zip: '66202',
    country: 'USA'
  },
  {
    name: 'Gracie Humaita Kansas City',
    street_address: '1323 Atlantic St',
    city: 'North Kansas City',
    state: 'MO',
    zip: '64116',
    country: 'USA'
  },
  {
    name: 'KiCK MARTIAL ARTS',
    street_address: '7683 NW Prairie View Rd.',
    city: 'Kansas City',
    state: 'MO',
    zip: '64151',
    country: 'USA'
  },
  {
    name: 'Wildfire Brazilian Jiu Jitsu',
    street_address: '1410 NW Vivion Road',
    city: 'Kansas City',
    state: 'MO',
    zip: '64118',
    country: 'USA'
  },
  {
    name: 'Warriors Academy KC',
    street_address: '1737 Oak Street',
    city: 'Kansas City',
    state: 'MO',
    zip: '64108',
    country: 'USA'
  },
  {
    name: 'Blue Springs Jiu-Jitsu, Inc.',
    street_address: '5225 E Us 40 Hwy',
    city: 'Blue Springs',
    state: 'Missouri',
    zip: '64015',
    country: 'USA'
  },
  {
    name: 'Brazil Academy',
    street_address: '11441 Strang Line Rd',
    city: 'Lenexa',
    state: 'KS',
    zip: '66215',
    country: 'USA'
  },
  {
    name: 'Northland Judo & Brazilian Jiu-Jitsu (Oak Park HS)',
    street_address: '825 NE 79th Terrace',
    city: 'Kansas City',
    state: 'MO',
    zip: '64118',
    country: 'USA'
  },
  {
    name: 'American Top Team KC',
    street_address: '10950 W 74th Terrace',
    city: 'Shawnee',
    state: 'KS',
    zip: '66203',
    country: 'USA'
  },
  {
    name: 'Cast Iron BJJ',
    street_address: '6603B Royal St.',
    city: 'Pleasant Valley',
    state: 'MO',
    zip: '64068',
    country: 'USA'
  },
  {
    name: 'St. Joseph Brazilian Jiu Jitsu & Mixed Martial Arts',
    street_address: '3935 B Sherman Avenue',
    city: 'St. Joseph',
    state: 'MO',
    zip: '64506',
    country: 'USA'
  },
  {
    name: '10th Planet Jiu Jitsu',
    street_address: '201 Branch Street',
    city: 'Platte City',
    state: 'MO',
    zip: '64079',
    country: 'USA'
  },
  {
    name: 'E3',
    street_address: '7010 West 83rd Street',
    city: 'Overland Park',
    state: 'KS',
    zip: '66204',
    country: 'USA'
  },
  {
    name: 'Rivers Brazilian Jiu Jitsu',
    street_address: '911 Massachusetts Street, Suite B4',
    city: 'Lawrence',
    state: 'KS',
    zip: '66044',
    country: 'USA'
  },
  {
    name: 'Midwest Combat Academy',
    street_address: '700 SE 7th Street',
    city: 'Topeka',
    state: 'KS',
    zip: '66603',
    country: 'USA'
  },
  {
    name: 'Criqui Academy Brazilian Jiu Jitsu',
    street_address: '5711 SW 21 St.',
    city: 'Topeka',
    state: 'KS',
    zip: '66604',
    country: 'USA'
  },
  {
    name: 'Springfield BJJ',
    street_address: '4032 W Lark Rd',
    city: 'Battlefield',
    state: 'MO',
    zip: '65619',
    country: 'USA'
  },
  {
    name: 'Team Fusion',
    street_address: '228 W Sunshine St E',
    city: 'Springfield',
    state: 'MO',
    zip: '65807',
    country: 'USA'
  },
  {
    name: 'Kokoro Training Academy',
    street_address: '212 W McDaniel Street',
    city: 'Springfield',
    state: 'MO',
    zip: '65806',
    country: 'USA'
  },
  {
    name: 'Leake Brazilian Jiu Jitsu',
    street_address: '2166 North Fox Hollow Dr Suite 5',
    city: 'Nixa',
    state: 'MO',
    zip: '65714',
    country: 'USA'
  },
  {
    name: 'Infinity Martial Arts',
    street_address: '2109 E Division St',
    city: 'Springfield',
    state: 'MO',
    zip: '65803',
    country: 'USA'
  },
  {
    name: 'Welcome Mat Judo Club',
    street_address: '3930 NE Antioch Rd',
    city: 'Kansas City',
    state: 'MO',
    zip: '64117',
    country: 'USA'
  },
  {
    name: 'Gracie Columbia',
    street_address: '2010 Chapel Plaza Ct Suite B',
    city: 'Columbia',
    state: 'MO',
    zip: '65203',
    country: 'USA'
  },
  {
    name: 'Cavalo Brazilian Jiu-Jitsu',
    street_address: '601 West Business Loop Suite 122',
    city: 'Columbia',
    state: 'MO',
    zip: '65201',
    country: 'USA'
  },
  {
    name: '68\’s Inside Sports',
    street_address: '11301 W. 88th St.',
    city: 'Overland Park',
    state: 'KS',
    zip: '66214',
    country: 'USA'
  },
  {
    name: 'Mabee Center – William Jewell College',
    street_address: '924 Highway H',
    city: 'Liberty',
    state: 'MO',
    zip: '64068',
    country: 'USA'
  },
  {
    name: 'Discovery Middle School',
    street_address: '800 Midjay Drive',
    city: 'Liberty',
    state: 'MO',
    zip: '64068',
    country: 'USA'
  },
  {
    name: 'Olympia Athletics & Events Centre',
    street_address: '49 Lawrence St',
    city: 'St. Charles',
    state: 'MO',
    zip: '63301',
    country: 'USA'
  },
  {
    name: 'Stormont Vail Events Center (formerly Kansas Expocentre)',
    street_address: '1 Expocentre Dr.',
    city: 'Topeka',
    state: 'KS',
    zip: '66612',
    country: 'USA'
  },
  {
    name: 'East Lawrence Recreation Center',
    street_address: '1245 E 15th St',
    city: 'Lawrence',
    state: 'KS',
    zip: '66047',
    country: 'USA'
  },
  {
    name: 'Baptist Bible College',
    street_address: '628 E Kearney St',
    city: 'Springfield',
    state: 'MO',
    zip: '65803',
    country: 'USA'
  }
]

users = User.where(admin: true)
users.each do |user|
  locations.each do |location_data|
    location = user.locations.create(location_data)
    location.save
    sleep 2
  end
end
