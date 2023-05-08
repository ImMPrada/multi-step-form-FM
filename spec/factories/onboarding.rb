FactoryBot.define do
  factory :onboarding do
    token { Faker::Internet.uuid }
    status { %w[active inactive].sample }
    current_step { [1, 2, 3].sample }

    association :owner, factory: :user
    association :account
  end
end
