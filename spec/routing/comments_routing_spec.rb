# frozen_string_literal: true

require 'rails_helper'

describe CommentsController, type: :routing do
  describe 'routing' do
    it 'routes to #edit' do
      expect(get: '/events/example-slug/comments/1/edit').to route_to('comments#edit', event_id: 'example-slug', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/events/example-slug/comments').to route_to('comments#create', event_id: 'example-slug')
    end

    it 'routes to #update via PUT' do
      expect(put: '/events/example-slug/comments/1').to route_to('comments#update', event_id: 'example-slug', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/events/example-slug/comments/1').to route_to('comments#update', event_id: 'example-slug', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/events/example-slug/comments/1').to route_to('comments#destroy', event_id: 'example-slug', id: '1')
    end
  end
end
