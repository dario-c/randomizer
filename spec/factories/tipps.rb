require 'faker'

FactoryGirl.define do 
  factory :tipp do |f|
    f.name { Faker::Name.name }  
    f.streetname { Faker::Address.street_name}
    f.city_id 1
    f.user_id 1

  end

end