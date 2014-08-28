# require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# city = City.create(name:"barcelona")


# user = User.create(name: "peter",email: "abc@abc.com", password: "qwerty123", role: "ambassador", karma:100)

# user2 = User.create(name: "jane",email: "aaa@aaa.com", password: "qwerty123")

# smelly = User.create(name: "smelly",email: "zzz@zzz.com", password: "qwerty123",role: "badkarma", karma:-10)

# (1..10).each do |x| 
#   Tipp.create(name: Faker::Company.name, city_id: city.id, user_id: user.id, streetname: Faker::Address.street_address, website: Faker::Internet.url, points: 10, remote_image_url: "http://lorempixel.com/1000/800/") 
# end


# offer_place = Tipp.create(name: Faker::Company.name, city_id: city.id, user_id: user.id, streetname: Faker::Address.street_address, offer: true, points: 100, remote_image_url: "http://lorempixel.com/1000/800/")

# troll_place =  Tipp.create(name: "Troll Place!!", city_id: city.id, user_id: smelly.id, points: 0, streetname: Faker::Address.street_address, offer: false, remote_image_url: "http://lorempixel.com/1000/800/")

# Comment.create(user_id: user.id, content: "Awesome Place!", tipp_id: Tipp.first.id)

