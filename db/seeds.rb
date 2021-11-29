# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#admin
email = "system@wepoop.com"
password = "something"
admin = User.create(email: email, password: password)

#users
5.times do |i|
  email = "user#{i}@wepoop.com"
  password = "something"
  User.create(email: email, password: password)
end

#toilets
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

User.all.each do |user|
  toilets = Toilet.all
  3.times do
    happy = rand(100) > 25
    review = Review.create(user: user, toilet: toilets.sample, happy: happy, status: "approved", comment: nil)
    Favorite.create(user: user, toilet: review.toilet) if review.happy == true && rand(100) > 50
  end
end
