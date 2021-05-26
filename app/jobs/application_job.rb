class ApplicationJob
  def self.perform_now(*args)
    TypoCi::Logger.info("Calling: #{name}")

    new.perform(*args)
  end
end
