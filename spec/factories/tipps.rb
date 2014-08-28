require 'faker'

FactoryGirl.define do 

  factory :tipp do 
    name { Faker::Name.name }  
    streetname { Faker::Address.street_name}
    city
    user
    image Faker::Company.logo 
  end

end