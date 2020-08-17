class ApplicationJob
  def self.perform_now(*args)
    TypoCi::Logger.info("Calling: #{self.name}")

    self.new.perform(*args)
  end
end
