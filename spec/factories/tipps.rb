require 'faker'

FactoryGirl.define do 


  factory :tipp do 
    name { Faker::Name.name }  
    streetname { Faker::Address.street_name}
    city_id 1
    user_id 1
  end

end