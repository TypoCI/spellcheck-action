require 'json'

# Parse the event data provided to the GitHub Action. It's more reliable then using the ENVs.
class Github::Event < ApplicationRecord
  attr_accessor :github_event_path

  def initialize(github_event_path:)
    @github_event_path = github_event_path || ENV['GITHUB_EVENT_PATH']
    TypoCi::Logger.info(data.inspect)
  end

  def head_sha
    data.dig(:after) || ENV['GITHUB_SHA']
  end

  def repository_full_name
    ENV['GITHUB_REPOSITORY']
  end

  def to_h
    {
      github_token: github_token,
      github_run_id: github_run_id,
      repository_full_name: repository_full_name,
      head_branch: head_branch,
      head_sha: head_sha,
      actor: actor,
      pull_request_number: nil
    }
  end

  # In pull requests this isn't the last commit, but a merge commit.
  # It's good for comparing changes, but not good for adding annotations.
  def github_sha
    ENV['GITHUB_SHA'] || head_sha
  end

  def github_token
    ENV['GITHUB_TOKEN']
  end

  def github_run_id
    ENV['GITHUB_RUN_ID']
  end

  def actor
    ENV['GITHUB_ACTOR']
  end

  def head_branch
    ENV['GITHUB_HEAD_REF']
  end

  private

  def data
    @data ||= begin
      JSON.parse(File.read(github_event_path), symbolize_names: true)
    rescue Errno::ENOENT
      {}
    end
  end
end
