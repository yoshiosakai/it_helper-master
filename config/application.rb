require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ItHelper
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :ja
    config.action_dispatch.default_headers["X-Frame-Options"] = "ALLOW-FROM http://localhost:3000/"

    config.time_zone = 'Tokyo'
    config.active_record.time_zone_aware_types = [:datetime, :time]

  end
end
