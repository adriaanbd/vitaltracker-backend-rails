# frozen_string_literal: true

class V1::UsersController < ApplicationController
  def show
    user = find_user
    return unless user

    render json: user, status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201
    else
      render json: { error: 'Cannot create user' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def find_user
    user = User.find_by(username: params[:username])
    return user if user

    render json: { error: "Cannot find user" }
    nil
  end
end