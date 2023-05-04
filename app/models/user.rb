class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'invalid email address'
  }
  validates :phone_number, presence: true

  has_many :accounts, foreign_key: 'owner_id', dependent: :destroy
  has_many :onboardings, dependent: :destroy
end
