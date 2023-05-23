class Account < ApplicationRecord
  validates :name, presence: true

  belongs_to :plan, optional: true

  has_one :onboarding, dependent: :destroy
  has_one :owner, through: :onboarding
  has_many :account_addons, dependent: :destroy
  has_many :addons, through: :account_addons
  has_many :suscriptions, dependent: :destroy

  accepts_nested_attributes_for :plan
end
