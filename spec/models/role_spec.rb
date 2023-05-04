require 'rails_helper'

RSpec.describe Role, type: :model do
  subject(:role) { build(:role) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:type) }
    it { is_expected.to validate_uniqueness_of(:type).case_insensitive }
  end

  describe 'associations' do
    it { is_expected.to have_many(:user_roles).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:user_roles) }
  end
end
