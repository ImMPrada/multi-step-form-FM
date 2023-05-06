FactoryBot.define do
  factory :recurrence do
    type { %w[yearly monthly weekly daily].sample }
    frecuence { Faker::Number.between(from: 1.0, to: 10.0) }
    acronym { Faker::Lorem.characters(number: 3) }
  end
end
