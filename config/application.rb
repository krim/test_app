require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework  :rspec,
                        view_specs:    false,
                        request_specs: false,
                        routing_specs: false
      g.view_specs      false
      g.helper_specs    false
      g.integration_tool :rspec
      g.fixture_replacement :factory_girl
    end
  end
end
