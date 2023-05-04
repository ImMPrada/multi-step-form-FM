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
end
