# frozen_string_literal: true

# no-doc
class UserRepresenter < Representable::Decorator
  include Representable::JSON

  property :user_name
  property :email_address
  collection :groups
end
