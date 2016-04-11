module Ecm::UserArea
  class UserPasswordsController < Passwords::BaseController
    def self.resource_class
      UserPassword
    end

    private

    def after_create_location
      new_user_session_path
    end
  end
end
