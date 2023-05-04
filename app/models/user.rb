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

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :accounts, foreign_key: 'owner_id', dependent: :destroy
  has_many :account_admins, foreign_key: 'admin_id', dependent: :destroy
  has_many :administrated_accounts, through: :account_admins
  has_many :onboardings, dependent: :destroy
end
