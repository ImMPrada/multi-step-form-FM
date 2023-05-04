FactoryBot.define do
  factory :account do
    activated { %w[true false].sample }
  end
end
