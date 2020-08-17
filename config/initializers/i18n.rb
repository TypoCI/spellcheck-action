require 'i18n'

I18n.load_path += Dir["#{Rails.root}/config/locales/**/*.{rb,yml}"]
