# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/1/locations').to route_to('locations#index', user_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/users/1/locations/new').to route_to('locations#new', user_id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'users/1/locations/1/edit').to route_to('locations#edit', user_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'users/1/locations').to route_to('locations#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'users/1/locations/1').to route_to('locations#update', user_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'users/1/locations/1').to route_to('locations#update', user_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'users/1/locations/1').to route_to('locations#destroy', user_id: '1', id: '1')
    end
  end
end
