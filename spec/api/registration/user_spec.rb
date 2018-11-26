# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user', type: :request do
  describe 'registration' do
    context 'when no username is provided' do
      let(:attributes) do
        {
          email_address: 'john@test.com',
          encrypted_password: 'topsekr3t'
        }
      end

      it 'should return an error' do
        post '/user/sign_up', params: attributes

        expect(response.body).to include(
          { 'user_name': ["can't be blank"] }.to_json
        )
      end

      it 'should not register the user' do
        expect do
          post '/user/sign_up', params: attributes
        end.not_to change(User, :count)
      end
    end

    context 'when no email address is provided' do
      let(:attributes) do
        {
          user_name: 'john_doe',
          encrypted_password: 'topsekr3t'
        }
      end

      it 'should return an error' do
        post '/user/sign_up', params: attributes

        expect(response.body).to include(
          { 'email_address': ["can't be blank"] }.to_json
        )
      end

      it 'should not register the user' do
        expect do
          post '/user/sign_up', params: attributes
        end.not_to change(User, :count)
      end
    end

    context 'when no password is provided' do
      let(:attributes) do
        {
          user_name: 'john_doe',
          email_address: 'john_doe@test.com'
        }
      end

      it 'should return an error' do
        post '/user/sign_up', params: attributes

        expect(response.body).to include(
          { 'encrypted_password': ["can't be blank"] }.to_json
        )
      end

      it 'should not register the user' do
        expect do
          post '/user/sign_up', params: attributes
        end.not_to change(User, :count)
      end
    end

    context 'when valid registration details are provided' do
      let(:valid_attributes) do
        {
          user_name: 'john_doe',
          email_address: 'john_doe@test.com',
          encrypted_password: 's3kret'
        }
      end

      it 'should be successful' do
        post '/user/sign_up', params: valid_attributes

        expect(response).to be_successful
      end

      it 'should register user successfully' do
        expect do
          post '/user/sign_up', params: valid_attributes
        end.to change(User, :count)
      end
    end
  end
end
