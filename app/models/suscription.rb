class Suscription < ApplicationRecord
  validates :accepted, presence: true
  validates :status, presence: true

  belongs_to :account
end
