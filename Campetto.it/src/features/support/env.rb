# features/support/env.rb

require 'cucumber/rails'
require 'capybara/rails'
require 'rack_session_access/capybara'
require 'database_cleaner/active_record'
require 'webmock/cucumber'

require_relative 'rack_session_middleware'

# Consenti solo le connessioni all'API di OpenCageData
WebMock.disable_net_connect!(allow: 'api.opencagedata.com')

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :selenium_chrome 
Capybara.app_host = 'http://localhost:3000'

# Configurazione di DatabaseCleaner
DatabaseCleaner.strategy = :transaction
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
  DatabaseCleaner.start
  # Imposta la chiave API di Stripe per i test
  Stripe.api_key = 'sk_test_1234567890abcdef' # Usa una chiave fittizia

  # Stub per Stripe::Charge.create
  stub_request(:post, /https:\/\/api\.stripe\.com\/v1\/charges/)
    .to_return(
      status: 200,
      body: {
        id: 'ch_test_charge',
        amount: 5000,
        currency: 'usd',
        status: 'succeeded'
      }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
end

After do
  DatabaseCleaner.clean
end

