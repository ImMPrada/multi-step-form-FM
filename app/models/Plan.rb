class Plan < ApplicationRecord
  validates :price, presence: true
  validates :frequence_number, presence: true
  validates :frequence_unit, presence: true
  validates :name, presence: true
  validates :active, presence: true

  has_many :accounts
end
