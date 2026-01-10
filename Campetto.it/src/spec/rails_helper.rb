# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/email/rspec'
require 'capybara/rspec'

# spec/rails_helper.rb
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless') # Esecuzione headless
  options.add_argument('--disable-gpu') # Disabilita la GPU (opzionale)
  options.add_argument('--window-size=1920,1080') # Dimensione finestra
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :selenium_chrome_headless # Modificato per utilizzare il driver headless
Capybara.javascript_driver = :selenium_chrome_headless # Modificato per utilizzare il driver headless

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false # Mantieni false per Active Record store

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!


  config.include Capybara::Email::DSL

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation # Usato per pulire il database
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

