require 'rails_helper'

RSpec.describe UserRole, type: :model do
  subject(:user_role) { build(:user_role) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:role) }
  end
end
