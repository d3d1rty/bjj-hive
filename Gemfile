# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use HAML instead of ERB
gem 'haml-rails', '~> 1.0'
# Use SCSS for stylesheets
gem 'sassc-rails', '~> 2.1'
# Use Font Awesome for iconography
gem 'font-awesome-sass', '~> 5.8.1'
# Use autoprefixer to handle vendor prefixes
gem 'autoprefixer-rails', '~> 9.4', '>= 9.4.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use clearance for authentication
gem 'clearance', '~> 1.16', '>= 1.16.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use geocoder for interacting with LocationIQ
gem 'geocoder', '~> 1.5', '>= 1.5.1'
# Use kaminari for pagination
gem 'kaminari', '~> 1.1', '>= 1.1.1'
# Use rack-attack to throttle abusive requests
gem 'rack-attack', '~> 6.0'
# Use ahoy for analytics
gem 'ahoy_matey', '~> 3.0'
# Use blazer for analytics dashboard
gem 'blazer', '~> 2.1'
# Use friendly id_for event URLs
gem 'friendly_id', '~> 5.2', '>= 5.2.5'
# Use closure_tree for nested comments and replies
gem 'closure_tree', '~> 7.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a console
  gem 'pry-byebug', '~> 3.6'
  # Use RSpec for testing
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
  # Use FactoryBot for test data
  gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use pry for console
  gem 'pry-rails', '~> 0.3.9'
  # Rubocop for code style guidelines
  gem 'rubocop', '~> 0.67.2'
  # Reek for code smells
  gem 'reek', '~> 5.3'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 3.8'
  # Use faker to generate test data
  gem 'faker', '~> 1.9', '>= 1.9.1'
  # Improved validations for testing
  gem 'shoulda-matchers', '~> 4.0', '>= 4.0.1'
  # Reset database to clean state for testing
  gem 'database_cleaner', '~> 1.7'
end
