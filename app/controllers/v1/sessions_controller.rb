# frozen_string_literal: true

class V1::SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user
      render json: user, status: 201
    else
      render json: { error: 'Invalid username' }, status: 401
    end
  end
end
