class Plan < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :icon_url, presence: true

  belongs_to :payment_recurrence

  has_many :accounts

  accepts_nested_attributes_for :payment_recurrence
end
