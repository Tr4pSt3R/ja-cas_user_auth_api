class Token < ApplicationRecord
  has_secure_token :auth_token
  belongs_to :user

  TOKEN_VALIDITY_PERIOD = 3_600

  def expired?
    (Time.now - updated_at) > TOKEN_VALIDITY_PERIOD
  end
end
