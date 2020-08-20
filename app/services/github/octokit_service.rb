require 'octokit'

# Wrapper for talking to Octokit. Normally used just to add preview headers
class Github::OctokitService
  def initialize(github_check_suite)
    @github_check_suite = github_check_suite
  end

  def client
    @client ||= Octokit::Client.new(access_token: @github_check_suite.github_token, auto_paginate: true)
  end

  def create_status(full_name, head_sha, status, options)
    options.merge!(
      accept: Octokit::Preview::PREVIEW_TYPES[:checks]
    )

    client.create_status(full_name, head_sha, status, options)
  end

  def create_check_run(repo, name, head_sha, options = {})
    options.merge!(
      accept: Octokit::Preview::PREVIEW_TYPES[:checks]
    )

    client.create_check_run(repo, name, head_sha, options)
  end

  def update_check_run(repo, id, options = {})
    options.merge!(
      accept: Octokit::Preview::PREVIEW_TYPES[:checks]
    )

    client.update_check_run(repo, id, options)
  end

  def get_pull_request_commits(repo, pull_request_number)
    options = {
      per_page: 100,
      accept: Octokit::Preview::PREVIEW_TYPES[:integrations]
    }

    client.pull_request_commits(repo, pull_request_number, options)
  end

  def get_pull_request_files(repo, pull_request_number)
    options = {
      per_page: 100,
      accept: Octokit::Preview::PREVIEW_TYPES[:integrations]
    }

    client.pull_request_files(repo, pull_request_number, options)
  end

  def commit(repo, head_sha)
    client.commit(repo, head_sha)
  end

  def compare(repo, base_ref, head_sha)
    client.compare(repo, base_ref, head_sha)
  end

  def get_file_contents(repo, filename, head_sha)
    contents = client.contents(repo, path: filename, ref: head_sha)
    Base64.decode64(contents[:content])
  end
end
