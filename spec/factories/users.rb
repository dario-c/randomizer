# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Peter"
    email "abc@abc.com"
    password "qwerty124"
  end
end
