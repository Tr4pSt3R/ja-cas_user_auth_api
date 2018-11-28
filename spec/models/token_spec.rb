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

  describe 'token refresh' do
    context 'when token is expired' do
      before do
        expect_any_instance_of(Token).to receive(
          :regenerate_auth_token
        ).and_return(
          true
        )
      end

      it 'regenerates a fresh token' do
        user = FactoryBot.create(:user, :authenticated)
        expired_token = user.token.auth_token

        travel_to(70.minutes.from_now) do
          user.secret_token
        end
      end
    end
  end
end
