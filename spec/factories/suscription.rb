FactoryBot.define do
  factory :suscription do
    accepted { %w[true false].sample }
    status { %w[active pending].sample }

    association :account
  end
end
