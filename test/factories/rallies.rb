# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :rally_name do |n|
    "Rally #{n}"
  end

  factory :rally do
    name { generate :rally_name }
    start_at Time.now
    end_at 2.hours.from_now
  end
end

