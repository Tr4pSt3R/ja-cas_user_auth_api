# frozen_string_literal: true

# no-op
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
