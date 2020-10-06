# I extracted this from a Rails app. So for common things, I've setup a class to use it like normal.
#
class Rails
  def self.root
    @root ||= Pathname.new(File.expand_path('./'))
  end

  def self.env
    ENV['APP_ENV'] || 'production'
  end
end
