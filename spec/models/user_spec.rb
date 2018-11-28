# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_presence_of(:email_address) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:token) }
  end
end
