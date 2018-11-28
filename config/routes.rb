Rails.application.routes.draw do
  post 'user/sign_up'
  get 'user/sign_in'
  get 'user/:auth_token' => 'user#user_details'
end
