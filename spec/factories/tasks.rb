FactoryBot.define do
  factory :task do
    ending_date { Faker::Date.forward(days: 10) }
    description { Faker::Lorem.sentence(word_count: 20) }
    task_type { Task.task_types.keys.sample }
    ticketNo { Faker::Alphanumeric.alphanumeric(number: 10) }
    priority { Faker::Number.between(from: 1, to: 10) }
    association :project
    association :developer, factory: :newuser
  end
end
