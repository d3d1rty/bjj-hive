# frozen_string_literal: true

require 'rails_helper'

describe EventsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/events').to route_to('events#index')
    end

    it 'routes to #new' do
      expect(get: '/users/1/events/new').to route_to('events#new', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/events/example-slug').to route_to('events#show', id: 'example-slug')
    end

    it 'routes to #edit' do
      expect(get: 'users/1/events/1/edit').to route_to('events#edit', user_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'users/1/events').to route_to('events#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: 'users/1/events/1').to route_to('events#update', user_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'users/1/events/1').to route_to('events#update', user_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'users/1/events/1').to route_to('events#destroy', user_id: '1', id: '1')
    end
  end
end
