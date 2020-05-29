require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AwesomeAnswersMarch202
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # active job is the background job framework built into rails. It handles running stuff in the background
    # delayed_job is a queue manager. It decides which jobs should run
    config.active_job.queue_adapter = :delayed_job

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Configure CORS
    config.middleware.insert_before 0, Rack::Cors do 
      allow do
        # origins specifies which domains are allowed to make AJAx
        # requests to the server
        origins 'localhost:8080', '127.0.0.1:8080', 'localhost:5500', '127.0.0.1:5500'


        resource(
          # allow access to only paths that begin with /api/
          "/api/*", 
          # this allows all HTTP headers to be sent
          headers: :any,
          # Allows sharing of cookies for CORS requests made to this resource
          credentials: true,
          # define the HTTP verbs which are allowed in a request
          methods: [:get, :post, :delete, :patch, :put, :options]
        )
      end
    end
  end
end
