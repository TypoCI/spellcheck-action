class Github::Event::Push < Github::Event
  def base_sha
    data.dig(:before)
  end
end
