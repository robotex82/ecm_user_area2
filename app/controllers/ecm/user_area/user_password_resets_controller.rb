module Ecm::UserArea
  class UserPasswordResetsController < PasswordResets::BaseController
    def self.resource_class
      User
    end
  end
end
