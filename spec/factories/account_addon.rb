FactoryBot.define do
  factory :account_addon do
    association :account
    association :addon
  end
end
