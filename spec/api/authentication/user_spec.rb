# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user', type: :request do
  describe 'authentication' do
    context 'when user does not exist' do
      let(:attributes) do
        {
          user_name: 'jane_doe',
          encrypted_password: 'topsekr3t'
        }
      end

      it 'does not respond with a uniquely generated token' do
        get '/user/sign_in', params: attributes

        expect(response.body).to include('User does not exist')
      end
    end

    context 'when user exists' do
      let(:params) do
        {
          user_name: 'john_doe',
          encrypted_password: 'topsekr3t'
        }
      end

      it 'responds with a uniquely generated user token' do
        User.create(
          user_name: 'john_doe',
          email_address: 'john_doe@test.com',
          encrypted_password: 'topsekr3t'
        )

        get '/user/sign_in', params: params

        expect(response.body).to include('user_token')
      end
    end
  end

  describe 'token validity period' do
    context 'when token is freshly generated' do
      it 'should be valid' do
      end
    end
  end
end
