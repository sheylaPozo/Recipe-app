# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'user2', email: 'user2@mail.com', password: 'password') }
  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'returns http ok' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Measurment unit')
    end
  end
end
