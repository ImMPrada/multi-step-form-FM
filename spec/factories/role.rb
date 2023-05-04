FactoryBot.define do
  factory :role do
    type { %i[owner admin].sample }
  end
end
