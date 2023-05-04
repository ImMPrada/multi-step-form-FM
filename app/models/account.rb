class Account < ApplicationRecord
  validates :activated, inclusion: { in: %w[true false] }, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  has_many :account_admins, dependent: :destroy
  has_many :admins, through: :account_admins
  has_one :onboarding, dependent: :destroy
end
