FactoryBot.define do
  factory :user do
    user_name { 'John Doe' }
    email_address { 'john_doe@test.com' }
    encrypted_password { 'topsekr3t' }
  end
end
