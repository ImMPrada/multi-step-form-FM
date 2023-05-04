class Account < ApplicationRecord
  validates :activated, inclusion: { in: %w[true false] }, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  has_one :onboarding, dependent: :destroy
end
