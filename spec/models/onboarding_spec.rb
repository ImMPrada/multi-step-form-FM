require 'rails_helper'

RSpec.describe Onboarding, type: :model do
  subject(:onboarding) { build(:onboarding) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_uniqueness_of(:token).case_insensitive }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:current_step) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:owner).class_name('User') }
  end

  describe '#pending?' do
    describe 'when status is in_progress' do
      before { onboarding.status = 'in_progress' }

      it 'returns true' do
        expect(onboarding.pending?).to be true
      end
    end

    describe 'when status is completed' do
      before { onboarding.status = 'completed' }

      it 'returns false' do
        expect(onboarding.pending?).to be false
      end
    end
  end
end
