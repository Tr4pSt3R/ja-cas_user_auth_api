require  'rails_helper'

RSpec.describe 'User::API', type: :request do
  describe 'retrieve user' do
    context 'when I supply an invalid token' do
      it 'should not return any user' do
        get '/user/BAD-1234'

        expect(response.body).to eq(
          { 'error': 'User not found' }.to_json
        )
      end
    end

    context 'when I supply a valid token' do
      it 'should return user with this token' do
        user = FactoryBot.create(:user, :authenticated)

        get "/user/#{user.secret_token}"

        expect(response.body).to eq(
          {
            'user_name': 'John Doe',
            'email_address': 'john_doe@test.com',
            'groups': []
          }.to_json
        )
      end
    end
  end
end
