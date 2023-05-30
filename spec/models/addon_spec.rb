require 'rails_helper'

RSpec.describe Addon, type: :model do
  subject(:addon) { build(:addon) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:icon_url) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:account_addons).dependent(:destroy) }
    it { is_expected.to have_many(:accounts).through(:account_addons) }
    it { is_expected.to belong_to(:payment_recurrence) }
  end
end
