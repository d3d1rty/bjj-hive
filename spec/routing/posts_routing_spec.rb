# frozen_string_literal: true

require 'rails_helper'

describe PostsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/posts').to route_to('posts#index')
    end

    it 'routes to #new' do
      expect(get: '/users/1/posts/new').to route_to('posts#new', user_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/posts/example-slug').to route_to('posts#show', id: 'example-slug')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/posts/example-slug/edit').to route_to('posts#edit', user_id: '1', id: 'example-slug')
    end

    it 'routes to #create' do
      expect(post: '/users/1/posts').to route_to('posts#create', user_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/posts/example-slug').to route_to('posts#update', user_id: '1', id: 'example-slug')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/posts/example-slug').to route_to('posts#update', user_id: '1', id: 'example-slug')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/posts/example-slug').to route_to('posts#destroy', user_id: '1', id: 'example-slug')
    end
  end
end
