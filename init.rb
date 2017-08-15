Rails.configuration.to_prepare do
  require_dependency 'application_controller'

  unless ApplicationController.included_modules.include?(RedmineUsernameLogging::Patches::ApplicationControllerPatch)
    ApplicationController.send(:include, RedmineUsernameLogging::Patches::ApplicationControllerPatch)
  end
end

Redmine::Plugin.register :redmine_username_logging do
  name 'Redmine Username Logging plugin'
  author 'tkuchiki'
  description 'This plugin add Redmine-User header to http response'
  version '0.1.0'
  url 'https://github.com/tkuchiki/redmine_username_logging'
  author_url 'https://github.com/tkuchiki'
end
