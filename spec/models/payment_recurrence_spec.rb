require 'rails_helper'

RSpec.describe PaymentRecurrence, type: :model do
  subject(:payment_recurrence) { build(:payment_recurrence) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_uniqueness_of(:type).case_insensitive }
    it { is_expected.to validate_presence_of(:acronym) }
    it { is_expected.to validate_presence_of(:days_delta) }
    it { is_expected.to validate_presence_of(:months_delta) }
    it { is_expected.to validate_presence_of(:years_delta) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:addons) }
    it { is_expected.to have_many(:plans) }
  end
end
