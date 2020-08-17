class Github::CheckSuites::AnalysisJob < ApplicationJob
  def perform(github_check_suite)
    @github_check_suite = github_check_suite

    check_for_typos!
    update_github_check_suite!

    TypoCi::Logger.info("Completed. files_analysed_count: #{analysis_service.files_analysed_count}, spelling_mistakes_count: #{analysis_service.spelling_mistakes_count}")

    Github::CheckSuites::UpdateRemoteJob.perform_now(github_check_suite)
  end

  private

  def check_for_typos!
    @github_check_suite.time_processing do
      annotations # This actually does the check & loads it into memory.
    end
  end

  def update_github_check_suite!
    # Save the results and some stats to the check suite.
    @github_check_suite.update!(
      conclusion: analysis_service.conclusion,
      files_analysed_count: analysis_service.files_analysed_count,
      spelling_mistakes_count: analysis_service.spelling_mistakes_count,
      invalid_words: analysis_service.invalid_words,
      annotations: annotations,
      file_name_extensions: analysis_service.file_name_extensions
    )
  end

  def annotations
    @annotations ||= analysis_service.annotations
  end

  def analysis_service
    @analysis_service ||= Github::CheckSuites::AnalysisService.new(@github_check_suite)
  end
end
