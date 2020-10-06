class Github::Event::PullRequest < Github::Event
  def supported_action?
    action.in?(%w[opened synchronize])
  end

  def action
    data[:action]
  end

  def pull_request_number
    data[:number]
  end

  def head_sha
    data.dig(:pull_request, :head, :sha) || ENV['GITHUB_SHA']
  end

  def to_h
    super.merge(
      pull_request_number: pull_request_number
    )
  end
end
