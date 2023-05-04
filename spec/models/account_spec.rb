require 'rails_helper'

RSpec.describe Account, type: :model do
  subject(:account) { build(:account) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:activated) }
    it { is_expected.to validate_inclusion_of(:activated).in_array(%w[true false]) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:owner).class_name('User').with_foreign_key('owner_id') }
    it { is_expected.to have_many(:account_admins).dependent(:destroy) }
    it { is_expected.to have_many(:admins).through(:account_admins) }
    it { is_expected.to have_one(:onboarding).dependent(:destroy) }
  end
end
