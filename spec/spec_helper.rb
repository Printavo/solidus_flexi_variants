require 'simplecov'
SimpleCov.start 'rails'

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'database_cleaner'
require 'factory_bot'
require 'ffaker'
require 'shoulda-matchers'
require 'pry'

require 'spree/testing_support/preferences'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/order_walkthrough'

# Rails 7.1+: 'spree/testing_support/factories' + cherry-picked loading triggers a class-level
# Spree::Deprecation.warn that crashes; use the non-deprecated loader the in-tree deprecation
# points to. add_paths_and_load! unshifts the Solidus core factory paths and reloads; this
# extension's own factories under spec/factories are already on FactoryBot's default relative
# paths (mirrors solidusio/solidus#3907).
require 'spree/testing_support/factory_bot'
Spree::TestingSupport::FactoryBot.add_paths_and_load!

require 'capybara/rspec'
require 'capybara-screenshot/rspec'

Capybara.default_max_wait_time = 10

# Safe-YAML: permit the column types this extension persists so Psych does not raise
# Psych::DisallowedClass under Rails' CVE-2022-32224 hardening (mirrors solidusio/solidus#4451).
if ActiveRecord.respond_to?(:yaml_column_permitted_classes)
  ActiveRecord.yaml_column_permitted_classes |= [BigDecimal, Date, Symbol, Time]
end

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Spree::TestingSupport::Preferences
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::ControllerRequests, type: :controller

  config.infer_spec_type_from_file_location!
  config.mock_with :rspec
  config.order = "random"
  config.color = true
  config.use_transactional_fixtures = false
  config.fail_fast = ENV['FAIL_FAST'] || false

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
