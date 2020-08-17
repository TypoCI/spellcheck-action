class Github::CheckSuites::AnalysisService
  def initialize(github_check_suite)
    @github_check_suite = github_check_suite
  end

  # Returns array of all annotations
  def annotations
    all_annotations
  end

  def all_annotations
    @all_annotations ||= files.collect(&:annotations).reject(&:nil?).flatten
  end

  def conclusion
    return 'action_required' if @github_check_suite.custom_configuration_present_and_invalid?

    spelling_mistakes_count.zero? ? 'success' : 'neutral'
  end

  def files_analysed_count
    files.count
  end

  def spelling_mistakes_count
    annotations.count
  end

  def invalid_words
    @invalid_words ||= files.collect(&:invalid_words).reject(&:nil?).flatten.collect(&:word).uniq
  end

  def file_name_extensions
    files.collect(&:file_name_extension).compact.uniq
  end

  private

  def configuration
    @github_check_suite.configuration
  end

  def files
    @files ||= github_diff.collect do |file|
      Github::FileService.new(
        file,
        repo: @github_check_suite.repository_full_name,
        head_sha: @github_check_suite.head_sha,
        configuration: configuration
      )
    end.select(&:analysable?)
  end

  def github_diff
    if @github_check_suite.pull_request?
      github_octokit_service.get_pull_request_files(@github_check_suite.repository_full_name, @github_check_suite.pull_request_number)
    else
      github_octokit_service.commit(@github_check_suite.repository_full_name, @github_check_suite.head_sha)[:files]
    end
  end

  def github_octokit_service
    @github_octokit_service ||= Github::OctokitService.new(@github_check_suite)
  end
end
