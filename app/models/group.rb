# frozen_string_literal: true

# no-op
class Group < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups

  validates :name, uniqueness: true
end
