FactoryBot.define do
  factory :plan do
    name { Faker::Lorem.word }
    price { Faker::Number.between(from: 10.0, to: 120.0) }
    status { %w[active inactive].sample }
    note { Faker::Lorem.sentence }
    icon_url { Faker::Internet.url }

    association :payment_recurrence
  end
end
