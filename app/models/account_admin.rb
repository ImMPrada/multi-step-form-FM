class AccountAdmin < ApplicationRecord
  belongs_to :administrated_account, class_name: 'Account', foreign_key: 'account_id'
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
end
