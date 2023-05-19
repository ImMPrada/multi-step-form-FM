class Plan < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :icon_url, presence: true

  belongs_to :payment_recurrence

  has_many :accounts
end
