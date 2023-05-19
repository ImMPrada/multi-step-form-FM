require 'rails_helper'

RSpec.describe Plan, type: :model do
  subject(:plan) { build(:plan) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:icon_url) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:accounts) }
    it { is_expected.to belong_to(:payment_recurrence) }
  end
end
