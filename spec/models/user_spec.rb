require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_confirmation_of(:password).with_message('passwords must match') }
  end

  describe 'associations' do
    it { is_expected.to have_many(:onboardings).with_foreign_key(:owner_id).dependent(:destroy) }
    it { is_expected.to have_many(:accounts).through(:onboardings).with_foreign_key(:owner_id) }
  end
end
