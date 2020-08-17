module TypoCi
  class App
    def self.run
      self.new.call
    end

    def call
      return unsupported_event_error unless supported_github_event?

      # Sweet lets do the processing.
      Github::CheckSuites::RequestedJob.perform_now(github_check_suite)
    end

    private

    def github_check_suite
      @github_check_suite ||= Github::CheckSuite.new(**github_event.to_h)
    end

    def github_event
      @github_event ||= Github::Event.const_get(ENV['GITHUB_EVENT_NAME'].classify)
                                     .new(github_event_path: ENV["GITHUB_EVENT_PATH"])
    end

    def supported_github_event?
      ENV['GITHUB_EVENT_NAME'].in?(['pull_request', 'push'])
    end

    def unsupported_event_error
      TypoCi::Logger.info("'#{ENV['GITHUB_EVENT_NAME']}' is an unsupported event. Skipping typo scan.")
    end
  end
end
