# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User::API', type: :request do
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

    describe 'token refresh' do
      let(:params) do
        {
          user_name: 'john_doe',
          encrypted_password: 'topsekr3t'
        }
      end

      context 'when user is authenticated successfully' do
        before do
          User.create(
            user_name: 'john_doe',
            email_address: 'john_doe@test.com',
            encrypted_password: 'topsekr3t'
          )
        end

        context 'when existing token is more than 2 hours old' do
          it 'regenerates a fresh token' do
            get '/user/sign_in', params: params
            archaic_response = response.body

            travel_to(3.hours.from_now) do
              get '/user/sign_in', params: params

              expect(response.body).not_to eq(archaic_response)
            end
          end
        end

        context 'when existing token is still valid' do
          it 'should not generate a fresh token' do
            get '/user/sign_in', params: params
            archaic_response = response.body

            travel_to(55.minutes.from_now) do
              get '/user/sign_in', params: params

              expect(response.body).to eq(archaic_response)
            end
          end
        end
      end
    end
  end
end
