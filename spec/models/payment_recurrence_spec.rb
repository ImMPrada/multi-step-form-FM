require 'rails_helper'

RSpec.describe PaymentRecurrence, type: :model do
  subject(:payment_recurrence) { build(:payment_recurrence) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_uniqueness_of(:type).case_insensitive }
    it { is_expected.to validate_presence_of(:frecuence) }
    it { is_expected.to validate_presence_of(:acronym) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:addons) }
    it { is_expected.to have_many(:plans) }
  end
end
