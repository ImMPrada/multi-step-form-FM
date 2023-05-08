class AccountAddon < ApplicationRecord
  validates :account_id, uniqueness: { scope: :addon_id }

  belongs_to :account
  belongs_to :addon
end
