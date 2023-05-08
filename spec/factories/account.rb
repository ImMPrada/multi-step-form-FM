FactoryBot.define do
  factory :account do
    name { Faker::Lorem.word }

    association :plan
  end
end
