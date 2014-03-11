# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :truck_name do |n|
    "Truck #{n}"
  end

  factory :truck do
    name { generate :truck_name }
    description "MyText"
  end
end

