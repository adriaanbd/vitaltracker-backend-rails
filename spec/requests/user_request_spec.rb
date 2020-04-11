require 'rails_helper'

RSpec.describe 'management', type: :request do
  let(:user) { build(:user) }
  let(:content_type) { 'application/json; charset=utf-8' }
  let(:valid_headers) { { 'ACCEPT' => 'application/json' } }
  let(:users_url) { '/v1/users' }

  it 'creates a user when given a username param' do
    user_params = { user: user.as_json({ except: %i[created_at updated_at id id] }) }
    post users_url, params: user_params, headers: valid_headers

    expect(response.content_type).to eq(content_type)
    expect(response).to have_http_status(:created)
  end
end
