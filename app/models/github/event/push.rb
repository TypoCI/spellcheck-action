class Github::Event::Push < Github::Event
  def supported_action?
    true
  end

  def action
    'push'
  end

  def base_sha
    data.dig(:before)
  end
end
