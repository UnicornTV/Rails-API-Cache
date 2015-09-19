require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Manticore
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'

    config.autoload_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.stylesheets false
      g.assets false
    end
  end
end
