class Onboarding < ApplicationRecord
  validates :token, presence: true, uniqueness: { case_sensitive: false }
  validates :status, presence: true
  validates :current_step, presence: true

  belongs_to :owner, class_name: 'User'
  belongs_to :account
end
