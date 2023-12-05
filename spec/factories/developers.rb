FactoryBot.define do
  factory :developer do
    specilization { Faker::Lorem.word }
    name { Faker::Name.name }
    age { Faker::Number.between(from: 18, to: 99) }
    phoneNo { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.unique.email }
    association :newuser, factory: :newuser
  end
end
