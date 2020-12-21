source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby File.read('.ruby-version').chomp

gem 'activesupport'
gem 'ffi-hunspell'
gem 'git'
gem 'git_diff_parser'
gem 'json-schema'
gem 'jwt'
gem 'mimemagic'
gem 'octokit'
gem 'rake'
gem 'sentry-raven'
gem 'zeitwerk'

group :development do
  gem 'i18n-debug'
  gem 'rubocop'
end

group :test do
  gem 'factory_bot'
  gem 'faker'
  gem 'rspec', '~> 3.10.0'
  gem 'simplecov'
  gem 'webmock', '~> 3.11'
end
