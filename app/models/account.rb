class Account < ApplicationRecord
  validates :activated, inclusion: { in: %w[true false] }, presence: true

  has_one :onboarding, dependent: :destroy
  has_one :owner, through: :onboarding, source: :owner
end
