# frozen_string_literal: true

##
# = Rack
# Author::    Richard Davis
#
# This provides the namespace for Rack Attack configuration.
module Rack
  ##
  # = Attack
  # Author::    Richard Davis
  #
  # This class provides configuration for the Rack Attack protection layer.
  class Attack
    # Throttle all requests by IP (60rpm)
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
    throttle('req/ip', limit: 300, period: 5.minutes, &:ip)

    # Throttle POST requests to /session by IP address
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:logins/ip:#{req.ip}"
    throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
      req.ip if req.path == '/session' && req.post?
    end

    # Throttle POST requests to /session by email param
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:logins/email:#{req.email}"
    throttle('logins/email', limit: 3, period: 20.seconds) do |req|
      if req.path == '/session' && req.post?
        # return the email if present, nil otherwise
        req.params['email'].presence
      end
    end

    # Throttle POST requests to /user by IP address
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:signups/ip:#{req.ip}"
    throttle('signups/ip', limit: 3, period: 20.seconds) do |req|
      req.ip if req.path == '/user' && req.post?
    end

    # Throttle GET requests to */events by IP address
    #
    # Key: "rack::attack:#{Time.now.to_i/:period}:events/ip:#{req.ip}"
    throttle('events/ip', limit: 3, period: 20.seconds) do |req|
      req.ip if req.path.include?('/events') && req.params['search'].present?
    end
  end
end
