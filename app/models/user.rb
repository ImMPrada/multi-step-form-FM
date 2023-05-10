class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable # , :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'invalid email address'
  }
  validates :phone_number, presence: true
  validates :password, presence: true, confirmation: { message: 'passwords must match' }
  validates :password_confirmation, presence: true

  has_many :onboardings, dependent: :destroy, foreign_key: :owner_id
  has_many :accounts, through: :onboardings, foreign_key: :owner_id
end
