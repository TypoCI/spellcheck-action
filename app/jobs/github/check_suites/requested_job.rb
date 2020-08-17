# Checks if we can analyse the commit, then loads the configuration information.
# If we can perform the analysis, it'll kick off the AnalysisJob.
class Github::CheckSuites::RequestedJob < ApplicationJob
  def perform(github_check_suite)
    @github_check_suite = github_check_suite

    if @github_check_suite.analysable?
      load_configuration!
      Github::CheckSuites::AnalysisJob.perform_now(github_check_suite)
    else
      TypoCi::Logger.info("Skipped, this commit looks automated")
    end
  end

  private

  def load_configuration!
    @github_check_suite.configuration = configuration_service.configuration
    @github_check_suite.custom_configuration_file = configuration_service.custom_configuration_file?
    @github_check_suite.custom_configuration_valid = configuration_service.custom_configuration_valid?
  end

  def configuration_service
    @configuration_service ||= Github::CheckSuites::ConfigurationService.new(@github_check_suite)
  end
end
