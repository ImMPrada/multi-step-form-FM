class PaymentRecurrence < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :acronym, presence: true
  validates :days_delta, presence: true
  validates :months_delta, presence: true
  validates :years_delta, presence: true

  has_many :addons
  has_many :plans

  scope :with_monthly_plans, -> { includes(:plans).find_by(acronym: 'mo').plans.where(status: 'available') }
  scope :with_yearly_plans, -> { includes(:plans).find_by(acronym: 'yo').plans.where(status: 'available') }
end
