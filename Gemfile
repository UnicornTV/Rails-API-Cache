source 'https://rubygems.org'
ruby '2.2.2'

# Server and Base Application
gem 'unicorn'
gem 'rails'
gem 'devise'
gem 'cancan'
gem 'hashugar'
gem 'omniauth'
# gem 'omniauth-facebook'
# gem 'omniauth-twitter'
# gem 'omniauth-github'

# Data stores
gem 'mongoid', github: 'mongoid/mongoid'
gem 'aws-sdk', '~> 2'
gem 'mongoid-app_settings'

# Assets
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'

# CMS
# gem 'annex-cms', github: 'unicorn/annex'

# Services
gem 'twitter'
gem 'twitter-text'

# Views
gem 'active_model_serializers'
gem 'haml'
gem 'haml-rails', group: :development
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'draper'
gem 'kaminari'

group :development do
  gem 'dotenv-rails'
  gem 'spring'
  gem 'quiet_assets'
  gem 'pry'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'mongoid-rspec'
  gem 'webmock'
end

# Heroku
group :production do
  gem 'rails_12factor'
end
