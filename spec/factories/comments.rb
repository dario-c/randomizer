# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    content "Awesome Place. Try the tacos!"
    user
    tipp
  end
end
