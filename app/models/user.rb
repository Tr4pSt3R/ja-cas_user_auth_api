# frozen_string_literal: true

#  no-doc
class User < ApplicationRecord
  has_one :token

  validates :user_name,
            :email_address,
            :encrypted_password, presence: true
end
