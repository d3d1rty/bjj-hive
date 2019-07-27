# frozen_string_literal: true

require 'rails_helper'

describe RepliesController, type: :routing do
  describe 'routing' do
    it 'routes to #edit' do
      expect(get: '/posts/example-slug/replies/1/edit').to route_to('replies#edit', post_id: 'example-slug', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/posts/example-slug/replies').to route_to('replies#create', post_id: 'example-slug')
    end

    it 'routes to #update via PUT' do
      expect(put: '/posts/example-slug/replies/1').to route_to('replies#update', post_id: 'example-slug', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/posts/example-slug/replies/1').to route_to('replies#update', post_id: 'example-slug', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/posts/example-slug/replies/1').to route_to('replies#destroy', post_id: 'example-slug', id: '1')
    end
  end
end
