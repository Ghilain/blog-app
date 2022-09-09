require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users/1/posts'
    end
  end
  describe 'GET /show' do
    before(:example) do
      get '/users/1/posts/1'
    end
  end
end
