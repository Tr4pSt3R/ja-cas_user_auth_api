require 'rails_helper'

RSpec.describe Token, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'token validity period' do
    let(:user) { FactoryBot.create(:user) }

    subject!(:token) { user.create_token }

    context 'when generated less than one hour ago' do
      it 'should be a valid token' do
        expect(token.expired?).to eq(false)
      end
    end

    context 'when generated more than one hour ago' do
      it 'should be an expired token' do
        travel_to(2.hours.from_now) do
          expect(token.expired?).to eq(true)
        end
      end
    end
  end
end
