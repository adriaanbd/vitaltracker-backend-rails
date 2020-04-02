# frozen_string_literal: true

class V1::VitalsController < ApplicationController
  def index
    vitals = find_vitals_by_user
    return unless vitals

    today = vitals.today
    yesterday = vitals.yesterday
    last_week = vitals.last_week
    render json: { today: today, yesterday: yesterday, last_week: last_week }, status: 200
  end

  def create
    vital = Vital.new(vital_params)
    if vital.save
      render json: vital, status: 201
    else
      render error: { error: 'Cannot create account' }
    end
  end

  private

  def vital_params
    params.require(:vital).permit(:category, :measure, :user_id)
  end

  def find_vitals
    vitals = Vital.find_by(category: params[:category])
    return vitals if vitals

    render json: { error: "Cannot find vital" }
    nil
  end

  def find_vitals_by_user
    vitals = Vital.where(user_id: params[:user_id])
  end
end