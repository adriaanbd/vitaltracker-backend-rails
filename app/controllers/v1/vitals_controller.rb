# frozen_string_literal: true

class V1::VitalsController < ApplicationController
  def index
    vitals = find_vitals_by_user
    return unless vitals

    query = params[:day]
    if query === 'today'
      data = vitals.today
    elsif query === 'yesterday'
      data = vitals.yesterday
    elsif query === 'more_than_1_day_ago'
      data = vitals.more_than_1_day_ago
    else
      data = { vitals: {today: vitals.today, yesterday: vitals.yesterday, more: vitals.more_than_1_day_ago} }
    end
    render json: data, status: 200
  end

  def create
    user = User.find(params[:user_id])
    vital = user.vitals.build(vital_params)
    if vital.save
      render json: vital, status: 201
    else
      render json: { error: 'Cannot create vital' }
    end
  end

  private

  def vital_params
    params.require(:vital).permit(:category, :measure)
  end

  def find_vitals_by_user
    vitals = Vital.where(user_id: params[:user_id])
  end
end