# frozen_string_literal: true

# no-doc
class UserController < ApplicationController
  # POST /sign_up
  def sign_up
    user = User.new user_params

    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:user_name, :email_address, :encrypted_password)
  end
end
