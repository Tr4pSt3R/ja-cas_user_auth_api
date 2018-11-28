# frozen_string_literal: true

#  no-doc
class User < ApplicationRecord
  has_one :token
  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :user_name,
            :email_address,
            :encrypted_password, presence: true

  scope :retrieve, lambda { |auth_token|
    joins(:token).where(tokens: { auth_token: auth_token })
  }

  def secret_token
    token.regenerate_auth_token if token.expired?

    token.auth_token
  end
end
