require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rspec101
  class Application < Rails::Application
    config.load_defaults 6.1
    config.generators.assets = false
    config.generators.helper = false
  end
end
