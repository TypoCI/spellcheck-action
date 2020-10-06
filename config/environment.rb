require_relative 'boot'

require 'active_support/all'

require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.push_dir('./lib')
loader.push_dir('./app/jobs')
loader.push_dir('./app/lib')
loader.push_dir('./app/models')
loader.push_dir('./app/services')
loader.setup

Dir['./config/initializers/**/*'].sort.each { |f| require f }

Spellcheck::Dictionaries.setup!
