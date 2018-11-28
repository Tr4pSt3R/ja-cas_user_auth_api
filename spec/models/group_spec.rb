require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:user_groups) }
    it { is_expected.to have_many(:users).through(:user_groups) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
