# frozen_string_literal: true

# no-doc
class UserController < ApplicationController
  # POST /user/sign_up
  def sign_up
    user = User.new user_params

    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # GET /user/sign_in
  def sign_in
    user = User.find_by(
      user_name: params[:user_name],
      encrypted_password: params[:encrypted_password]
    )

    if user
      user.create_token if user.token.nil?

      render json: { user_token: user.secret_token }
    else
      render json: 'User does not exist', status: :not_found
    end
  end

  # GET /user/:auth_params
  def user_details
    # TODO: Move to User class as a scope
    user = User.joins(:token).where(tokens: { auth_token: params[:auth_token] }).first

    if user
      render json: UserRepresenter.new(user)
    else
      render json: { error: 'User not found' }
    end
  end

  private

  def user_params
    params.permit(:user_name, :email_address, :encrypted_password)
  end
end
