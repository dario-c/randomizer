require 'faker'

FactoryGirl.define do 
  factory :tipp do |f|
    f.name { Faker::Name.name }  
    f.streetname { Faker::Address.street_name }   
  end 
end