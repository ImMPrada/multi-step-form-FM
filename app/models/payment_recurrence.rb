class PaymentRecurrence < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :acronym, presence: true
  validates :days_delta, presence: true
  validates :months_delta, presence: true
  validates :years_delta, presence: true

  has_many :addons
  has_many :plans
end
