require 'rails_helper'

RSpec.describe Suscription, type: :model do
  subject(:suscription) { build(:suscription) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:accepted) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:account) }
  end
end
