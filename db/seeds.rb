require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

city = City.create(name:"barcelona")

(1..10).each do |x| 
  Tipp.create(name: Faker::Company.name, city:city) 
end


User.create(name: "Peter",email: "abc@abc.com", password: "qwerty123", role: "ambassador")
