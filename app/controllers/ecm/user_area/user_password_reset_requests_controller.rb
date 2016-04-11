module Ecm::UserArea
  class UserPasswordResetRequestsController < PasswordResetRequests::BaseController
    def self.resource_class
      UserPasswordResetRequest
    end

    private

    def after_create_location
      new_user_session_path
    end
  end
end
