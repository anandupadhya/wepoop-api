# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Favorite.destroy_all
Review.destroy_all
Toilet.destroy_all
AuthenticationToken.destroy_all
User.destroy_all

#admin
puts "creating the admin"
email = "g"
password = "something"
admin = User.create(email: email, password: password, admin: true)

#users
puts "creating users..."
5.times do |i|
  email = "user#{i}@wepoop.com"
  password = "something"
  User.create(email: email, password: password)
end

#toilets
puts "creating toilets..."
Toilet.create(
  address: "1515 Anyi Road",
  longitude: 121.4452639,
  latitude: 31.2247847,
  accessibility: true,
  changing_station: true,
  directions: "Fifth floor next to the MickeyD's",
  male: true,
  female: true,
  approved: true,
  description: "Jing'an Kerry Centre",
  user: admin
)

Toilet.create(
  address: "Huashan Road, 200031",
  longitude: 121.434841,
  latitude: 31.218192,
  accessibility: false,
  changing_station: false,
  directions: "When you enter the store go directly to the end and turn left.",
  male: true,
  female: true,
  approved: true,
  description: "Coffee Pls",
  user: admin
)
Toilet.create(
  address: "Middle Yan'an",
  longitude: 121.44808028800783,
  latitude: 31.22370875630693,
  accessibility: true,
  changing_station: true,
  directions: "Try third floor if first floor is full.",
  male: true,
  female: true,
  approved: true,
  description: "Equatorial Hotel",
  user: admin
)

Toilet.create(
  address: "155 Middle Wulumuqi Road",
  longitude: 121.43880018212404,
  latitude: 31.21989524570796,
  accessibility: false,
  changing_station: false,
  directions: "3rd floor next to the ballroom",
  male: true,
  female: true,
  approved: true,
  description: "Shanghai Hotel",
  user: admin
)

Toilet.create(
  address: "105 Middle Wulumuqi Road, Jing'an District, China",
  longitude: 121.439142,
  latitude: 31.221368,
  accessibility: false,
  changing_station: false,
  directions: "Take the elevator to the 9th floor, knock on the door, and pretend you are a student who last her key card. For the men's restrooom, turn right. For women's, turn left.",
  male: true,
  female: true,
  approved: true,
  description: "Le Wagon Shanghai",
  user: admin
)

##############NEW TOILETS########

Toilet.create(
  address: "68 Yuyuan Rd.",
  longitude: 121.4418747,
  latitude: 31.22754,
  accessibility: true,
  changing_station: true,
  directions: "Walk 25 meters after yuyuan entrance. Next to Nike store",
  male: true,
  female: true,
  approved: true,
  description: "Crystal Galleria",
  user: admin
)
Toilet.create(
  address: "849 Jiangsu Rd.",
  longitude: 121.4230354,
  latitude: 31.2260517,
  accessibility: true,
  changing_station: true,
  directions: "The toilet is on the street",
  male: true,
  female: true,
  approved: true,
  description: "Public Toilet",
  user: admin
)
Toilet.create(
  address: "55 Fahuazhen Rd.",
  longitude: 121.4146226,
  latitude: 31.2094065,
  accessibility: false,
  changing_station: false,
  directions: "This toilet is on the street",
  male: true,
  female: true,
  approved: true,
  description: "Public Toilet",
  user: admin
)
Toilet.create(
  address: "102 Yixueyuan Rd.",
  longitude: 121.4521243,
  latitude: 31.2016601,
  accessibility: false,
  changing_station: false,
  directions: "This toilet is on the street",
  male: true,
  female: true,
  approved: true,
  description: "Public Toilet",
  user: admin
)
Toilet.create(
  address: "2 Guangyuan Rd.",
  longitude: 121.4359733,
  latitude: 31.2012256,
  accessibility: false,
  changing_station: false,
  directions: "This toilet is on the street",
  male: true,
  female: true,
  approved: true,
  description: "Public Toilet",
  user: admin
)
Toilet.create(
  address: "43 Tianping Rd.",
  longitude: 121.44709,
  latitude: 31.19594,
  accessibility: false,
  changing_station: false,
  directions: "This toilet is on the street",
  male: true,
  female: true,
  approved: true,
  description: "Public Toilet",
  user: admin
)
Toilet.create(
  address: "148 South Wulumuqi Rd.",
  longitude: 121.44789,
  latitude: 31.19606,
  accessibility: false,
  changing_station: false,
  directions: "This toilet is on the street",
  male: true,
  female: true,
  approved: true,
  description: "Public Toilet",
  user: admin
)
Toilet.create(
  address: "221 Yueyang Rd.",
  longitude: 121.4478442,
  latitude: 31.2074908,
  accessibility: false,
  changing_station: false,
  directions: "This toilet is on the street",
  male: true,
  female: true,
  approved: true,
  description: "Public Toilet",
  user: admin
)
Toilet.create(
  address: "195 Anfu Rd",
  longitude: 121.4389529,
  latitude: 31.2157395,
  accessibility: false,
  changing_station: false,
  directions: "Left side of the end of the store",
  male: true,
  female: true,
  approved: true,
  description: "Baker & Spice",
  user: admin
)
Toilet.create(
  address: "1266 West Nanjing Rd.",
  longitude: 121.45323009478852,
  latitude: 31.229495011288456,
  accessibility: true,
  changing_station: true,
  directions: "First floor next to Starbucks Coffee",
  male: true,
  female: true,
  approved: true,
  description: "Plaza 66",
  user: admin
)
###################

puts "creating favorites and reviews..."
User.all.each do |user|
  toilets = Toilet.all
  3.times do
    happy = rand(100) > 25
    review = Review.create(user: user, toilet: toilets.sample, happy: happy, status: "approved", comment: nil)
    Favorite.create(user: user, toilet: review.toilet) if review.happy == true && rand(100) > 50
  end
end
