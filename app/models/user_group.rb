# frozen_string_literal: true

# no-op
class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
