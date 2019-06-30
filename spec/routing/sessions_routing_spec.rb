# frozen_string_literal: true

require 'rails_helper'

describe SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/sign_in').to route_to('sessions#new')
    end

    it 'routes to #create' do
      expect(post: '/session').to route_to('sessions#create')
    end
  end
end
