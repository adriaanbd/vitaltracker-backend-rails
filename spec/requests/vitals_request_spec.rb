require 'rails_helper'

RSpec.describe "management", type: :request do
  let(:valid_user) { create(:user) }
  let(:valid_vital) { build(:vital) }
  let(:content_type) { "application/json; charset=utf-8" }
  let(:valid_headers) { {"ACCEPT" => "application/json"} }
  let(:users_url) { "/v1/users"  }

  it 'creates a Vital with valid params' do
    vital_params = { :vital => valid_vital.as_json({except: [:created_at, :updated_at, :id, :user_id]})}
    post "#{users_url}/#{valid_user.id}/vitals", params: vital_params, headers: valid_headers

    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:created)
  end

  it 'does not create a Vital without measure attribute' do
    vital_params = { :vital => valid_vital.as_json({except: [:measure, :created_at, :updated_at, :id, :user_id]})}
    post "#{users_url}/#{valid_user.id}/vitals", params: vital_params, headers: valid_headers
    response_body = JSON.parse(response.body)
    expect(response_body['error']).to include('Cannot create vital')
  end

  it 'does not create a Vital without category attribute' do
    vital_params = { :vital => valid_vital.as_json({except: [:category, :created_at, :updated_at, :id, :user_id]})}
    post "#{users_url}/#{valid_user.id}/vitals", params: vital_params, headers: valid_headers
    response_body = JSON.parse(response.body)
    expect(response_body['error']).to include('Cannot create vital')
  end

  it 'gets a vitals object with today, yesterday and more_than_1_day_ago keys' do
    vital_params = { :vital => valid_vital.as_json({except: [:created_at, :updated_at, :id, :user_id]})}
    get "#{users_url}/#{valid_user.id}/vitals", params: vital_params, headers: valid_headers
    expect(response).to have_http_status(:success)
    response_body = JSON.parse(response.body)
    expect(response_body).to eq({"vitals" => {"today" => [], "yesterday" => [], "more_than_1_day_ago" => []}})
  end
end
