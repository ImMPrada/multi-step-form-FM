class Account < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'invalid email address'
  }
end
