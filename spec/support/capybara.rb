# frozen_string_literal: true

# capybara
require 'capybara/rspec'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 options: Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu])
end

Capybara.javascript_driver = :chrome
Capybara.default_max_wait_time = 1
