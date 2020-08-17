# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['APP_ENV'] = 'test'

ENV['GITHUB_TOKEN'] = ""
ENV['GITHUB_REPOSITORY'] = "Sample/TestRepo"
ENV['GITHUB_BASE_REF'] = ""
ENV['GITHUB_REF'] = ""
ENV['GITHUB_HEAD_REF'] = ""
ENV['GITHUB_ACTOR'] = "TestUser"

require 'simplecov'
SimpleCov.start do
  # Ignore really small one line files for now.
  add_filter do |source_file|
    source_file.lines.count <= 2
  end
end

# Add additional requires below this line.
require './config/environment'
require 'webmock/rspec'
require 'faker'
require 'factory_bot'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Disable external connections - Mock them within the app.
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
