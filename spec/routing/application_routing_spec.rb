# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :routing do
  describe 'routing' do
    it 'routes to #accept_cookies' do
      expect(post: '/accept-cookies').to route_to('application#accept_cookies')
    end
  end
end
