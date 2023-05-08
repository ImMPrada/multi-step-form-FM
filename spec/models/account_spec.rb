require 'rails_helper'

RSpec.describe Account, type: :model do
  subject(:account) { build(:account) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:onboarding).dependent(:destroy) }
    it { is_expected.to have_one(:owner).through(:onboarding) }
    it { is_expected.to have_many(:account_addons).dependent(:destroy) }
    it { is_expected.to have_many(:addons).through(:account_addons) }
    it { is_expected.to have_many(:suscriptions).dependent(:destroy) }
  end
end
