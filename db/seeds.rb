require 'json'
require 'open-uri'

Favorite.destroy_all
Review.destroy_all
Toilet.destroy_all
AuthenticationToken.destroy_all
User.destroy_all

# admin
puts "creating the admin"
email = "wepoop@system.com"
password = "something"
admin = User.create(email: email, password: password, admin: true)

# users
puts "creating users..."
5.times do |i|
  email = "user#{i}@wepoop.com"
  password = "something"
  User.create(email: email, password: password)
end

# toilets
puts "creating toilets..."

raw_data = File.read('./db/tencent_toilets.json')
toilet_data = JSON.parse(raw_data)
toilet_data.each do |toilet|
  puts "creating toilet... ID: #{toilet['id']}"
  Toilet.create(
    address: toilet["address"],
    longitude: toilet["location"]["lng"],
    latitude: toilet["location"]["lat"],
    accessibility: nil,
    changing_station: nil,
    directions: nil,
    male: true,
    female: true,
    approved: true,
    description: toilet["title"],
    user: admin
  )
end

puts "Cleansing toilets..."

Toilet.all.each do |toilet|
  nearby_toilets = Toilet.near([toilet.latitude, toilet.longitude], 0.01)
  nearby_toilets.each do |nearby_toilet|
    next if nearby_toilet.id == toilet.id

    nearby_toilet.destroy
  end
end

# Toilet.create(
#   address: "1515 Anyi Road",
#   longitude: 121.44526,
#   latitude: 31.22478,
#   accessibility: true,
#   changing_station: true,
#   directions: "Fifth floor next to the MickeyD's",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Jing'an Kerry Centre",
#   user: admin
# )

# Toilet.create(
#   address: "Huashan Road, 200031",
#   longitude: 121.43484,
#   latitude: 31.21819,
#   accessibility: false,
#   changing_station: false,
#   directions: "When you enter the store go directly to the end and turn left.",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Coffee Pls",
#   user: admin
# )

# Toilet.create(
#   address: "Middle Yan'an",
#   longitude: 121.44808,
#   latitude: 31.22370,
#   accessibility: true,
#   changing_station: true,
#   directions: "Try third floor if first floor is full.",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Equatorial Hotel",
#   user: admin
# )

# Toilet.create(
#   address: "155 Middle Wulumuqi Road",
#   longitude: 121.43880,
#   latitude: 31.21989,
#   accessibility: false,
#   changing_station: false,
#   directions: "3rd floor next to the ballroom",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Shanghai Hotel",
#   user: admin
# )

# Toilet.create(
#   address: "105 Middle Wulumuqi Road, Jing'an District, China",
#   longitude: 121.43914,
#   latitude: 31.22136,
#   accessibility: false,
#   changing_station: false,
#   directions: "Take the elevator to the 9th floor, knock on the door, and pretend you are a student who last her key card. For the men's restrooom, turn right. For women's, turn left.",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Le Wagon Shanghai",
#   user: admin
# )

# ##############NEW TOILETS########

# Toilet.create(
#   address: "68 Yuyuan Rd.",
#   longitude: 121.44187,
#   latitude: 31.22754,
#   accessibility: true,
#   changing_station: true,
#   directions: "Walk 25 meters after yuyuan entrance. Next to Nike store",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Crystal Galleria",
#   user: admin
# )
# Toilet.create(
#   address: "849 Jiangsu Rd.",
#   longitude: 121.42303,
#   latitude: 31.22605,
#   accessibility: true,
#   changing_station: true,
#   directions: "The toilet is on the street",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Public Toilet",
#   user: admin
# )
# Toilet.create(
#   address: "55 Fahuazhen Rd.",
#   longitude: 121.41462,
#   latitude: 31.20940,
#   accessibility: false,
#   changing_station: false,
#   directions: "This toilet is on the street",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Public Toilet",
#   user: admin
# )
# Toilet.create(
#   address: "102 Yixueyuan Rd.",
#   longitude: 121.45212,
#   latitude: 31.20166,
#   accessibility: false,
#   changing_station: false,
#   directions: "This toilet is on the street",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Public Toilet",
#   user: admin
# )
# Toilet.create(
#   address: "2 Guangyuan Rd.",
#   longitude: 121.43597,
#   latitude: 31.20122,
#   accessibility: false,
#   changing_station: false,
#   directions: "This toilet is on the street",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Public Toilet",
#   user: admin
# )
# Toilet.create(
#   address: "43 Tianping Rd.",
#   longitude: 121.44709,
#   latitude: 31.19594,
#   accessibility: false,
#   changing_station: false,
#   directions: "This toilet is on the street",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Public Toilet",
#   user: admin
# )
# Toilet.create(
#   address: "148 South Wulumuqi Rd.",
#   longitude: 121.44789,
#   latitude: 31.19606,
#   accessibility: false,
#   changing_station: false,
#   directions: "This toilet is on the street",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Public Toilet",
#   user: admin
# )
# Toilet.create(
#   address: "221 Yueyang Rd.",
#   longitude: 121.44784,
#   latitude: 31.20749,
#   accessibility: false,
#   changing_station: false,
#   directions: "This toilet is on the street",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Public Toilet",
#   user: admin
# )
# Toilet.create(
#   address: "195 Anfu Rd",
#   longitude: 121.43895,
#   latitude: 31.21573,
#   accessibility: false,
#   changing_station: false,
#   directions: "Left side of the end of the store",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Baker & Spice",
#   user: admin
# )
# Toilet.create(
#   address: "1266 West Nanjing Rd.",
#   longitude: 121.45323,
#   latitude: 31.22949,
#   accessibility: true,
#   changing_station: true,
#   directions: "First floor next to Starbucks Coffee",
#   male: true,
#   female: true,
#   approved: true,
#   description: "Plaza 66",
#   user: admin
# )
###################

puts "creating favorites and reviews..."
toilets = Toilet.all
User.all.each do |user|
  3.times do
    happy = rand(100) > 25
    review = Review.create(user: user, toilet: toilets.sample, happy: happy, status: "approved", comment: nil)
    Favorite.create(user: user, toilet: review.toilet) if review.happy == true && rand(100) > 50
  end
end
