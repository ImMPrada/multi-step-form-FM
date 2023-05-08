require 'rails_helper'

RSpec.describe AccountAddon, type: :model do
  subject(:account_addon) { build(:account_addon) }

  describe 'associations' do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:addon) }
  end
end
