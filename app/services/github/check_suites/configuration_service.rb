class Github::CheckSuites::ConfigurationService
  attr_accessor :custom_configuration_file, :custom_configuration_valid

  alias custom_configuration_valid? custom_configuration_valid
  alias custom_configuration_file? custom_configuration_file

  def initialize(github_check_suite)
    @custom_configuration_file = false
    @custom_configuration_valid = false
    @github_check_suite = github_check_suite
  end

  def configuration
    @configuration ||= Spellcheck::Configuration.new(custom_configuration).tap do |new_configuration|
      new_configuration.excluded_words += @github_check_suite.repository_full_name.split('/')
      new_configuration.excluded_words += committers
      new_configuration.excluded_words.uniq!
    end
  end

  private

  def custom_configuration
    custom_configuration_contents = (get_typo_ci_file_custom_configuration('.typo-ci.yml') || get_typo_ci_file_custom_configuration('.github/.typo-ci.yml'))
    return {} unless custom_configuration_contents

    @custom_configuration_file = true
    yaml_configuration = YAML.safe_load(custom_configuration_contents)
    @custom_configuration_valid = true
    yaml_configuration
  rescue Psych::SyntaxError, Octokit::NotFound
    {}
  end

  def get_typo_ci_file_custom_configuration(file_name)
    github_octokit_service.get_file_contents(@github_check_suite.repository_full_name, file_name, @github_check_suite.head_sha)
  rescue Octokit::NotFound
    nil
  end

  def committers
    committers_source = if @github_check_suite.pull_request?
                          github_octokit_service.get_pull_request_commits(@github_check_suite.repository_full_name, @github_check_suite.pull_request_number)
                        else
                          [github_octokit_service.commit(@github_check_suite.repository_full_name, @github_check_suite.head_sha)]
                        end
    committers_source.collect do |commit|
      login = commit[:committer][:login] if commit[:committer].present?
      name = commit[:commit][:author][:name].split(' ') if commit[:commit].present? && commit[:commit][:author].present?

      [login, name]
    end.flatten.compact
  end

  def github_octokit_service
    @github_octokit_service ||= Github::OctokitService.new(@github_check_suite)
  end
end
