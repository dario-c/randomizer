require 'faker'

FactoryGirl.define do 
  factory :tipp do |f|
    f.name { Faker::Name.name }  
    f.streetname { Faker::Address.street_name }   
  end

  factory :invalid_tipp, parent: :tipp do |f|
    f.name nil  
  end 

end