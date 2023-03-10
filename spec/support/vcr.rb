# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('API-URL') { 'https://jsonplaceholder.typicode.com' }
  config.ignore_localhost = true
  config.ignore_hosts('127.0.0.1', 'localhost', '0.0.0.0', 'chromedriver.storage.googleapis.com')
end
