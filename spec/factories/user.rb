# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    user_name { 'John Doe' }
    email_address { 'john_doe@test.com' }
    encrypted_password { 'topsekr3t' }

    trait :authenticated do
      token
    end
  end
end
