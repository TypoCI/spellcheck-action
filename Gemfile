source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').chomp

gem 'rake'

# Exception Notifier
gem 'sentry-raven'

# Spell Checker
gem 'ffi-hunspell' # , github: 'postmodern/ffi-hunspell', branch: 'master'
gem 'mimemagic'

# GitHub API
gem 'git'
gem 'git_diff_parser'
gem 'jwt'
gem 'octokit'

# Validating JSON/YAML
gem 'json-schema'

# Ruby Library Loader
gem 'zeitwerk'

# Make dates & such easier in plain Ruby
gem 'activesupport'

group :development do
  gem 'github_changelog_generator', '~> 1.15.0'
  gem 'i18n-debug'
  gem 'rubocop', '~> 0.89.1'
end

group :test do
  gem 'codecov', '~> 0.2.5', require: false
  gem 'faker'
  gem 'rspec', '~> 3.9.0'
  gem 'simplecov'
  gem 'webmock', '~> 3.8'
  gem 'factory_bot'
end
