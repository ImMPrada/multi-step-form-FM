FactoryBot.define do
  factory :payment_recurrence do
    name { %w[yearly monthly weekly daily].sample }
    acronym { Faker::Lorem.characters(number: 3) }
    days_delta { Faker::Number.between(from: 0.0, to: 30.0) }
    months_delta { Faker::Number.between(from: 0.0, to: 12.0) }
    years_delta { Faker::Number.between(from: 0.0, to: 10.0) }
  end
end
