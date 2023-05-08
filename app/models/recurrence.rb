class Recurrence < ApplicationRecord
  validates :type, presence: true, uniqueness: { case_sensitive: false }
  validates :frecuence, presence: true
  validates :acronym, presence: true

  has_many :addons
  has_many :plans
end
