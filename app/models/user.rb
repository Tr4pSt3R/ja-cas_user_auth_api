# frozen_string_literal: true

class User < ApplicationRecord
  validates :user_name, :email_address, presence: true
  validates :encrypted_password, presence: true
end
