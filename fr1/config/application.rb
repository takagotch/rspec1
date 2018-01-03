require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module App
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework   = "rspec"
      g.controller_specs = false
      g.helper_specs     = false
      g.view_specs       = false
    end
  end
end

