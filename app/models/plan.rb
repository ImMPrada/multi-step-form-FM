class Plan < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :status, presence: true

  belongs_to :recurrence

  has_many :accounts
end
