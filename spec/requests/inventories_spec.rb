require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/inventories/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/inventories/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/inventories/destroy'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /compare' do
    it 'returns http success' do
      get '/inventories/compare'
      expect(response).to have_http_status(:success)
    end
  end
end
