class Github::Event::PullRequest < Github::Event
  def pull_request_number
    data.dig(:number)
  end

  def head_sha
    data.dig(:pull_request, :head, :sha) || ENV['GITHUB_SHA']
  end

  def to_h
    super.merge({
                  pull_request_number: pull_request_number
                })
  end
end
