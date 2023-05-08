require 'rails_helper'

RSpec.describe Recurrence, type: :model do
  subject(:recurrence) { build(:recurrence) }

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