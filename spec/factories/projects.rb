FactoryBot.define do
  factory :project do
    project_name { Faker::Lorem.word }
    starting_date { Faker::Date.backward(days: 10) }
    ending_date { Faker::Date.forward(days: 10) }
    association :newuser, factory: :newuser
  end
end
