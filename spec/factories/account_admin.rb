FactoryBot.define do
  factory :account_admin do
    association :administrated_account, factory: :account
    association :admin, factory: :user
  end
end
