# frozen_string_literal: true

#  no-doc
class User < ApplicationRecord
  has_one :token

  validates :user_name,
            :email_address,
            :encrypted_password, presence: true

  def secret_token
    token.regenerate_auth_token if token.expired?

    token.auth_token
  end
end
