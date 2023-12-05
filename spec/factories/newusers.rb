FactoryBot.define do
  factory :newuser do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
