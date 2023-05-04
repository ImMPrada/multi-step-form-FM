FactoryBot.define do
  factory :account do
    activated { %w[true false].sample }

    association :owner, factory: :user
  end
end
