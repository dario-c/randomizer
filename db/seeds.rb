# require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


barcelona = City.create(name:'barcelona')

randomizer = User.create(name: "randomizer", role: "ambassador", karma: 100, email: "abc1@abc.com", password: "qwerty123" )

peter = User.create(name: "peter", role: "ambassador", karma: 106, email: "abc2@abc.com", password: "qwerty123")

jane = User.create(name: "jane", role: "regular", karma: 10, email: "abc3@abc.com", password: "qwerty123")

juan = User.create(name: "juan", role: "regular", karma: 10, email: "abc4@abc.com", password: "qwerty123")


macba = Tipp.create(city: barcelona, user: peter, name: "MACBA",streetname: "Plaza dels Angels 1", website: "http://www.macba.cat/en/", twitter: "MACBA_Barcelona", points: 100, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/macba.jpg')))

soulkitchen = Tipp.create(city: barcelona, user: peter, name: "soulkitchen",streetname: "Plaza de Sant Pere 10", website: "https://www.facebook.com/soulkitchen.santpere/timeline", twitter: "kreuzberg75", points: 100, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/soulkitchen.jpg')))

oval = Tipp.create(city: barcelona, user: peter, name: "oval",streetname: "Carrer de Valencia 199", website: "http://www.ovalbcn.com/", twitter: "Oval_Bcn", points: 100, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/oval.jpg')))

sidecar = Tipp.create(city: barcelona, user: jane, name: "sidecar",streetname: "Plaza Reial 7", website: "http://www.sidecarfactoryclub.com/", twitter: "SIDECARbcn", points: 10, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/sidecar.jpg')))

heliogabal = Tipp.create(city: barcelona, user: jane, name: "heliogabal",streetname: "Carrer Ramon y Cajal 80", website: "http://www.heliogabal.com/", twitter: "HeliogabalBcn", points: 10, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/heliogabal.jpg')))

mosquito = Tipp.create(city: barcelona, user: jane, name: "mosquito",streetname: "Carrer Carders 46", website: "http://www.mosquitotapas.com/", points: 10, offer: false, image: File.open(File.join(Rails.root, '/app/assets/images/mosquito.jpg')))

nomad = Tipp.create(city: barcelona, user: randomizer, name: "nomad coffee",streetname: "Pasaje de Sert", website: "https://www.facebook.com/nomadcoffeeproductions", points: 100, offer: true, image: File.open(File.join(Rails.root, '/app/assets/images/nomad.jpg')))


Comment.create(user: peter, content: "I love Macba, for me one of the best museum in Barcelona, and it has lots of awesome Tapas places around", tipp: macba)

Comment.create(user: jane, content: "I'm not into museums that much, but Macba is great for skating!", tipp: macba)

Comment.create(user: peter, content: "Fresh juices, focaccias, noodles, cakes... there is not a single thing I couldn't recommend from Soulkitchen", tipp: soulkitchen)

Comment.create(user: jane, content: "Their cakes are INSANE! Specially the carrot cake!", tipp: soulkitchen)

Comment.create(user: juan, content: "They are famous for cakes, but I really like their focaccias", tipp: soulkitchen)

Comment.create(user: peter, content: "Probably the best burger in Barcelona. Just kidding, it is the best one!", tipp: oval)

Comment.create(user: juan, content: "Great burgers! Totally recommend the Caprese one, mmmmmmm....", tipp: oval)

Comment.create(user: jane, content: "The temple of indie rock for more that 25 years! Awesome vibe and life music", tipp: sidecar)

Comment.create(user: juan, content: "My favorite place to go out, they have great bands!", tipp: sidecar)

Comment.create(user: peter, content: "Great Dimsum! I recommend to go with lots of people and share different dimsum", tipp: mosquito)

Comment.create(user: peter, content: "Love their Dimsum! And its great for sharing! (Try the duck)", tipp: mosquito)

Comment.create(user: jane, content: "The place for your hipster nights in Gracia", tipp: heliogabal)

Comment.create(user: randomizer, content: "Be the First one to tweet today and get 2 coffees for free and a visit to their coffee brewery! use: #nomad and #randomizer ", tipp: nomad)


