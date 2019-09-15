# frozen_string_literal: true

require 'rails_helper'

describe PagesController, type: :routing do
  describe 'routing' do
    it 'routes to #landing_page' do
      expect(get: '/').to route_to('pages#landing_page')
    end

    it 'routes to #about' do
      expect(get: '/about').to route_to('pages#about')
    end

    it 'routes to #privacy_policy' do
      expect(get: '/privacy-policy').to route_to('pages#privacy_policy')
    end

    it 'routes to #terms_of_service' do
      expect(get: '/terms-of-service').to route_to('pages#terms_of_service')
    end

    it 'routes to #contact_us' do
      expect(get: '/contact-us').to route_to('pages#contact_us')
    end

    it 'routes to #contact' do
      expect(post: '/contact').to route_to('pages#contact')
    end

    it 'routes to #sitemap' do
      expect(get: '/sitemap.xml').to route_to(format: 'xml', controller: 'pages', action: 'sitemap')
    end
  end
end
