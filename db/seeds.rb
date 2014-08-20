require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

city = City.create(name:"barcelona")


user = User.create(name: "peter",email: "abc@abc.com", password: "qwerty123", role: "ambassador", karma:100)

user2 = User.create(name: "jane",email: "aaa@aaa.com", password: "qwerty123")

(1..10).each do |x| 
  Tipp.create(name: Faker::Company.name, city_id: city.id, user_id: user.id, streetname: Faker::Address.street_address) 
end


Comment.create(user_id: user.id, content: "Awesome Place!", tipp_id: Tipp.first.id)