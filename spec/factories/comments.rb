# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    content "Awesome Place. Try the tacos!"
    user_id 2
    tipp_id 1
  end
end
