class Github::CheckSuite < ApplicationRecord
  BlockedAuthors = [
    'pull[bot]',
    'tensorflow-copybara',
    'restyled-io[bot]',
    'github-actions[bot]',
    'renovate[bot]',
    'dependabot-preview[bot]',
    'dependabot[bot]',
    'depfu[bot]',
    'imgbot[bot]',
    'github-actions[bot]',
    'gatsbybot',
    'greenkeeper[bot]',
    'allcontributors[bot]'
  ].freeze

  attr_accessor :github_token,
                :github_run_id,
                :repository_full_name,
                :head_sha,
                :pull_request_number,
                :head_branch, :actor,
                :configuration,
                :custom_configuration_file,
                :custom_configuration_valid,
                :check_run_id,
                :conclusion,
                :started_at,
                :completed_at,
                :files_analysed_count,
                :spelling_mistakes_count,
                :invalid_words,
                :annotations,
                :file_name_extensions,
                :sender_type,
                :repository_private

  alias custom_configuration_valid? custom_configuration_valid
  alias custom_configuration_file? custom_configuration_file

  def initialize(github_token: nil, github_run_id: nil, repository_full_name: nil, head_branch: nil, head_sha: nil, pull_request_number: nil, actor: nil, sender_type: nil, repository_private: nil)
    @github_token = github_token
    @github_run_id = github_run_id
    @repository_full_name = repository_full_name
    @head_branch = head_branch
    @head_sha = head_sha
    @pull_request_number = pull_request_number
    @actor = actor
    @sender_type = sender_type
    @repository_private = repository_private

    TypoCi::Logger.info([sender_type, repository_private].inspect)

    @conclusion = 'pending'
    @configuration = nil
    @custom_configuration_file = false
    @custom_configuration_valid = false
  end

  def to_gid_param
    github_run_id
  end

  def analysable?
    return false if actor_banned?
    return false if gh_pages_branch? && !pull_request?

    true
  end

  def gh_pages_branch?
    head_branch.present? && head_branch.include?('gh-pages')
  end

  def pull_request?
    pull_request_number.present?
  end

  def custom_configuration_present_and_invalid?
    custom_configuration_file? && !custom_configuration_valid?
  end

  def time_processing
    @started_at = Time.zone.now
    yield
    @completed_at = Time.zone.now
  end

  def processing_duration
    return nil if @completed_at.nil?

    @completed_at.to_i - @started_at.to_i
  end

  private

  def actor_banned?
    actor.in?(BlockedAuthors)
  end
end
