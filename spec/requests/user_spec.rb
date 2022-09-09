require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users'
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    before(:example) do
      get '/users/1'
    end
  end
end
