class Role < ApplicationRecord
  validates :type, presence: true, uniqueness: { case_sensitive: false }

  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles
end
