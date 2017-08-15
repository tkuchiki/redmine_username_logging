module RedmineUsernameLogging::Patches::ApplicationControllerPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable
      after_action :add_redmine_user_header
    end
  end

  module InstanceMethods
    def add_redmine_user_header
      if response.respond_to?(:headers)
        response.headers["Redmine-User"] = User.current.logged? ? User.current.login : "anonymous"
      end
    end
  end
end
