require 'raven'

unless ENV['RAILS_ENV'] == 'test'
  Raven.configure do |config|
    config.dsn = ENV['SENTRY_DSN'] || 'https://77d375e64eab417499917a0345ae8701@o432733.ingest.sentry.io/5385950'
    config.logger = Logger.new(nil)
  end
end

Raven.user_context(
  github_repository: ENV['GITHUB_REPOSITORY'],
  input_typo_ci_license_key: ENV['INPUT_TYPO_CI_LICENSE_KEY']
)
Raven.extra_context(
  username: ENV['GITHUB_ACTOR'],
  ruby_version: ENV['RUBY_VERSION'],
  github_ref: ENV['GITHUB_REF'],
  github_sha: ENV['GITHUB_SHA'],
  github_event_name: ENV['GITHUB_EVENT_NAME'],
  github_server_url: ENV['GITHUB_SERVER_URL'],
  github_api_url: ENV['GITHUB_API_URL']
)
