require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'fog/aws'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)


module Nomster
  class Application < Rails::Application

    # Add fonts path
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    
    # Precompile additional assets
    config.assets.precompile += %w( .svg .eot .woff .ttf )

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
