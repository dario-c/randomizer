# require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


barcelona = City.create!(name:'barcelona')

randomizer = User.create!(name: "randomizer", role: "ambassador", karma: 100, email: "abc3@abc.com", password: "qwerty123" )

peter = User.create!(name: "peter", role: "ambassador", karma: 106, email: "abc@abc.com", password: "qwerty123")

jane = User.create!(name: "jane", role: "regular", karma: 10, email: "abc2@abc.com", password: "qwerty123")


macba = Tipp.create!(city: barcelona, user: peter, name: "MACBA",streetname: "Plaza dels Angels 1", website: "http://www.macba.cat/en/", twitter: "MACBA_Barcelona", points: 100, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/macba.jpg')))

soulkitchen = Tipp.create!(city: barcelona, user: peter, name: "soulkitchen",streetname: "Plaza de Sant Pere 10", website: "https://www.facebook.com/soulkitchen.santpere/timeline", twitter: "kreuzberg75", points: 100, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/soulkitchen.jpg')))

oval = Tipp.create!(city: barcelona, user: peter, name: "oval",streetname: "Carrer de Valencia 199", website: "http://www.ovalbcn.com/", twitter: "Oval_Bcn", points: 100, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/oval.jpg')))

sidecar = Tipp.create!(city: barcelona, user: jane, name: "sidecar",streetname: "Plaza Reial 7", website: "http://www.sidecarfactoryclub.com/", twitter: "SIDECARbcn", points: 10, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/sidecar.jpg')))

heliogabal = Tipp.create!(city: barcelona, user: jane, name: "heliogabal",streetname: "Carrer Ramon y Cajal 80", website: "http://www.heliogabal.com/", twitter: "HeliogabalBcn", points: 10, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/heliogabal.jpg')))

mosquito = Tipp.create!(city: barcelona, user: jane, name: "mosquito",streetname: "Carrer Carders 46", website: "http://www.mosquitotapas.com/", points: 10, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/mosquito.jpg')))

nomad = Tipp.create!(city: barcelona, user: randomizer, name: "nomad coffee",streetname: "Pasaje de Sert", website: "https://www.facebook.com/nomadcoffeeproductions", points: 100, offer: true, image: File.open(File.join(Rails.root, '/app/assets/images/nomad.jpg')))



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

