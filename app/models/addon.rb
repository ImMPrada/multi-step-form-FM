class Addon < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :status, presence: true

  belongs_to :payment_recurrence

  has_many :account_addons, dependent: :destroy
  has_many :accounts, through: :account_addons
end
