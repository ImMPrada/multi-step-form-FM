require 'rails_helper'

RSpec.describe AccountAdmin, type: :model do
  subject(:account_admin) { build(:account_admin) }

  describe 'associations' do
    it { is_expected.to belong_to(:administrated_account).class_name('Account').with_foreign_key('account_id') }
    it { is_expected.to belong_to(:admin).class_name('User').with_foreign_key('admin_id') }
  end
end
