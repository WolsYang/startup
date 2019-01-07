require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

module Startup
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
	
	# 設定載入路徑
	config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

	# 設定預設語系 zh or en
	config.i18n.default_locale = "zh-TW"

	# use default locale when translation missing
	config.i18n.fallbacks = true

	config.time_zone = "Taipei"
	
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
