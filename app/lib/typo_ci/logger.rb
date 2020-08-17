module TypoCi
  class Logger
    def self.info(message)
      return unless ENV['APP_ENV'] == 'production'

      puts "[Typo CI] #{message}"
    end
  end
end
